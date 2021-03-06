//
//  ConfirmVPNPlanViewController.swift
//  PIALibrary-iOS
//
//  Created by Jose Antonio Blaya Garcia on 14/11/2018.
//  Copyright © 2020 Private Internet Access, Inc.
//
//  This file is part of the Private Internet Access iOS Client.
//
//  The Private Internet Access iOS Client is free software: you can redistribute it and/or
//  modify it under the terms of the GNU General Public License as published by the Free
//  Software Foundation, either version 3 of the License, or (at your option) any later version.
//
//  The Private Internet Access iOS Client is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
//  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
//  details.
//
//  You should have received a copy of the GNU General Public License along with the Private
//  Internet Access iOS Client.  If not, see <https://www.gnu.org/licenses/>.
//

import UIKit
import SwiftyBeaver

private let log = SwiftyBeaver.self

public class ConfirmVPNPlanViewController: AutolayoutViewController, BrandableNavigationBar, WelcomeChild {

    @IBOutlet private weak var buttonConfirm: PIAButton!
    @IBOutlet private weak var textEmail: BorderedTextField!
    @IBOutlet private weak var textAgreement: UITextView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelSubtitle: UILabel!

    private var signupEmail: String?
    private var signupTransaction: InAppTransaction?
    weak var completionDelegate: WelcomeCompletionDelegate?
    var omitsSiblingLink = false
    var termsAndConditionsAgreed = false

    var preset: Preset?
    private var allPlans: [PurchasePlan] = [.dummy, .dummy]
    private var selectedPlanIndex: Int?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        guard let preset = self.preset else {
            fatalError("Preset not propagated")
        }

        guard let planIndex = selectedPlanIndex else {
            return
        }

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: Theme.current.palette.navigationBarBackIcon?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(back(_:))
        )
        self.navigationItem.leftBarButtonItem?.accessibilityLabel = L10n.Welcome.Redeem.Accessibility.back

        labelTitle.text = L10n.Welcome.Purchase.Confirm.Form.email
        let plan = allPlans[planIndex]
        labelSubtitle.text = L10n.Welcome.Purchase.Confirm.plan(plan.title.lowercased())
        textAgreement.attributedText = Theme.current.agreementText(
            withMessage: L10n.Welcome.Agreement.message,
            tos: L10n.Welcome.Agreement.Message.tos,
            tosUrl: Client.configuration.tosUrl,
            privacy: L10n.Welcome.Agreement.Message.privacy,
            privacyUrl: Client.configuration.privacyUrl
        )

        textEmail.placeholder = L10n.Welcome.Purchase.Email.placeholder
        textEmail.text = preset.purchaseEmail
        self.styleConfirmButton()
    }

    /// Populate the view with the values from PurchaseViewController
    /// - Parameters:
    ///   - plans:           The available plans.
    ///   - selectedIndex:   The selected plan from the previous screen.
    func populateViewWith(plans: [PurchasePlan], andSelectedPlanIndex selectedIndex: Int) {
        self.allPlans = plans
        self.selectedPlanIndex = selectedIndex
    }
    
    @IBAction private func signUp(_ sender: Any?) {
        guard let planIndex = selectedPlanIndex else {
            return
        }
        guard let email = textEmail.text?.trimmed(), Validator.validate(email: email) else {
            signupEmail = nil
            Macros.displayImageNote(withImage: Asset.iconWarning.image,
                                    message: L10n.Welcome.Purchase.Error.validation)
            self.status = .error(element: textEmail)
            return
        }
        
        guard termsAndConditionsAgreed else {
            //present term and conditions
            self.performSegue(withIdentifier: StoryboardSegue.Welcome.presentGDPRTermsSegue.rawValue,
                              sender: nil)
            return
        }

        self.status = .restore(element: textEmail)
        
        let plan = allPlans[planIndex]
        guard !plan.isDummy else {
            Macros.displayImageNote(withImage: Asset.iconWarning.image,
                                    message: L10n.Welcome.Iap.Error.Message.unavailable)
            return
        }
        
        disableInteractions()

        preset?.accountProvider.isAPIEndpointAvailable({ [weak self] (isAvailable, error) in
            self?.enableInteractions()
            guard let isAvailable = isAvailable,
                isAvailable else {
                    Macros.displayImageNote(withImage: Asset.iconWarning.image,
                                            message: L10n.Welcome.Purchase.Error.Connectivity.description)
                    return
            }
            self?.startPurchaseProcessWithEmail(email,
                                                andPlan: plan)
        })
        
    }

    private func disableInteractions() {
        parent?.view.isUserInteractionEnabled = false
    }
    
    private func enableInteractions() {
        parent?.view.isUserInteractionEnabled = true
    }

    private func startPurchaseProcessWithEmail(_ email: String,
                                               andPlan plan: PurchasePlan) {
        
        guard !Client.store.hasUncreditedTransactions else {
            let alert = Macros.alert(
                nil,
                L10n.Signup.Purchase.Uncredited.Alert.message
            )
            alert.addCancelAction(L10n.Signup.Purchase.Uncredited.Alert.Button.cancel)
            alert.addActionWithTitle(L10n.Signup.Purchase.Uncredited.Alert.Button.recover) {
                self.navigationController?.popToRootViewController(animated: true)
                Macros.postNotification(.PIARecoverAccount)
            }
            present(alert, animated: true, completion: nil)
            return

        }

        //textEmail.text = email
        log.debug("Will purchase plan: \(plan.product)")
        
        disableInteractions()
        self.showLoadingAnimation()
        
        preset?.accountProvider.purchase(plan: plan.plan) { (transaction, error) in
            self.enableInteractions()
            self.hideLoadingAnimation()

            guard let transaction = transaction else {
                if let error = error {
                    var message = error.localizedDescription
                    log.error("Purchase failed (error: \(error))")
                    Macros.displayImageNote(withImage: Asset.iconWarning.image,
                                            message: message)
                } else {
                    log.warning("Cancelled purchase")
                }
                return
            }
            
            log.debug("Purchased with transaction: \(transaction)")
            
            self.signupEmail = email
            self.signupTransaction = transaction
            self.perform(segue: StoryboardSegue.Welcome.signupViaPurchaseSegue)
        }
        
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == StoryboardSegue.Welcome.signupViaPurchaseSegue.rawValue) {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! SignupInProgressViewController
            
            guard let email = signupEmail else {
                fatalError("Signing up and signupEmail is not set")
            }
            var metadata = SignupMetadata(email: email)
            metadata.title = L10n.Signup.InProgress.title
            metadata.bodySubtitle = L10n.Signup.InProgress.message
            vc.metadata = metadata
            vc.signupRequest = SignupRequest(email: email, transaction: signupTransaction)
            vc.preset = preset
            vc.completionDelegate = completionDelegate
        } else if (segue.identifier == StoryboardSegue.Welcome.presentGDPRTermsSegue.rawValue) {
            
            let gdprViewController = segue.destination as! GDPRViewController
            gdprViewController.delegate = self
            
        }
    }
    
    // MARK: Restylable
    override public func viewShouldRestyle() {
        super.viewShouldRestyle()
        navigationItem.titleView = NavigationLogoView()
        Theme.current.applyNavigationBarStyle(to: self)
        Theme.current.applyPrincipalBackground(view)
        Theme.current.applyInput(textEmail)
        Theme.current.applyTitle(labelTitle, appearance: .dark)
        Theme.current.applySubtitle(labelSubtitle)
        Theme.current.applyLinkAttributes(textAgreement)
    }
    
    private func styleConfirmButton() {
        buttonConfirm.setRounded()
        buttonConfirm.style(style: TextStyle.Buttons.piaGreenButton)
        buttonConfirm.setTitle(L10n.Welcome.Purchase.submit.uppercased(),
                               for: [])
    }

}

extension ConfirmVPNPlanViewController: GDPRDelegate {
    
    public func gdprViewWasAccepted() {
        self.termsAndConditionsAgreed = true
        self.signUp(nil)
    }
    
    public func gdprViewWasRejected() {
        self.termsAndConditionsAgreed = false
    }
    
}
