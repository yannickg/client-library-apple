// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  internal enum Signup {
    internal enum Failure {
      /// We're unable to create an account at this time. Please try again later. Reopening the app will re-attempt to create an account.
      internal static let message = L10n.tr("Signup", "failure.message")
      /// GO BACK
      internal static let submit = L10n.tr("Signup", "failure.submit")
      /// Account creation failed
      internal static let title = L10n.tr("Signup", "failure.title")
      /// Sign-up failed
      internal static let vcTitle = L10n.tr("Signup", "failure.vc_title")
      internal enum Purchase {
        internal enum Sandbox {
          /// The selected sandbox subscription is not available in production.
          internal static let message = L10n.tr("Signup", "failure.purchase.sandbox.message")
        }
      }
      internal enum Redeem {
        internal enum Claimed {
          /// Looks like this card has already been claimed by another account. You can try entering a different PIN.
          internal static let message = L10n.tr("Signup", "failure.redeem.claimed.message")
          /// Card claimed already
          internal static let title = L10n.tr("Signup", "failure.redeem.claimed.title")
        }
        internal enum Invalid {
          /// Looks like you entered an invalid card PIN. Please try again.
          internal static let message = L10n.tr("Signup", "failure.redeem.invalid.message")
          /// Invalid card PIN
          internal static let title = L10n.tr("Signup", "failure.redeem.invalid.title")
        }
      }
    }
    internal enum InProgress {
      /// We're confirming your purchase with our system. It could take a moment so hang in there.
      internal static let message = L10n.tr("Signup", "in_progress.message")
      /// Confirm sign-up
      internal static let title = L10n.tr("Signup", "in_progress.title")
      internal enum Redeem {
        /// We're confirming your card PIN with our system. It could take a moment so hang in there.
        internal static let message = L10n.tr("Signup", "in_progress.redeem.message")
      }
    }
    internal enum Purchase {
      internal enum Trials {
        /// Browse anonymously and hide your ip.
        internal static let anonymous = L10n.tr("Signup", "purchase.trials.anonymous")
        /// Support 10 devices at once
        internal static let devices = L10n.tr("Signup", "purchase.trials.devices")
        /// Try free for 7 days!
        internal static let intro = L10n.tr("Signup", "purchase.trials.intro")
        /// Connect to any region easily
        internal static let region = L10n.tr("Signup", "purchase.trials.region")
        /// More than 3300 servers in 32 countries
        internal static let servers = L10n.tr("Signup", "purchase.trials.servers")
        /// Start subscription
        internal static let start = L10n.tr("Signup", "purchase.trials.start")
        internal enum _1year {
          /// 1 year of privacy and identity protection
          internal static let protection = L10n.tr("Signup", "purchase.trials.1year.protection")
        }
        internal enum All {
          /// See all available plans
          internal static let plans = L10n.tr("Signup", "purchase.trials.all.plans")
        }
        internal enum Devices {
          /// Protect yourself on up to 10 devices at a time.
          internal static let description = L10n.tr("Signup", "purchase.trials.devices.description")
        }
        internal enum Money {
          /// 7 day money back guarantee
          internal static let back = L10n.tr("Signup", "purchase.trials.money.back")
        }
        internal enum Price {
          /// Only %@ after
          internal static func after(_ p1: String) -> String {
            return L10n.tr("Signup", "purchase.trials.price.after", p1)
          }
        }
      }
      internal enum Uncredited {
        internal enum Alert {
          /// You have uncredited transactions. Do you want to recover your account details?
          internal static let message = L10n.tr("Signup", "purchase.uncredited.alert.message")
          internal enum Button {
            /// Cancel
            internal static let cancel = L10n.tr("Signup", "purchase.uncredited.alert.button.cancel")
            /// Recover account
            internal static let recover = L10n.tr("Signup", "purchase.uncredited.alert.button.recover")
          }
        }
      }
    }
    internal enum Success {
      /// Thank you for signing up with us. We have sent your account username and password at your email address at %@
      internal static func messageFormat(_ p1: String) -> String {
        return L10n.tr("Signup", "success.message_format", p1)
      }
      /// GET STARTED
      internal static let submit = L10n.tr("Signup", "success.submit")
      /// Purchase complete
      internal static let title = L10n.tr("Signup", "success.title")
      internal enum Password {
        /// Password
        internal static let caption = L10n.tr("Signup", "success.password.caption")
      }
      internal enum Redeem {
        /// You will receive an email shortly with your username and password.\n\nYour login details
        internal static let message = L10n.tr("Signup", "success.redeem.message")
        /// Card redeemed successfully
        internal static let title = L10n.tr("Signup", "success.redeem.title")
      }
      internal enum Username {
        /// Username
        internal static let caption = L10n.tr("Signup", "success.username.caption")
      }
    }
    internal enum Unreachable {
      /// No internet connection found. Please confirm that you have an internet connection and hit retry below.\n\nYou can come back to the app later to finish the process.
      internal static let message = L10n.tr("Signup", "unreachable.message")
      /// TRY AGAIN
      internal static let submit = L10n.tr("Signup", "unreachable.submit")
      /// Whoops!
      internal static let title = L10n.tr("Signup", "unreachable.title")
      /// Error
      internal static let vcTitle = L10n.tr("Signup", "unreachable.vc_title")
    }
  }
  internal enum Ui {
    internal enum Global {
      /// Cancel
      internal static let cancel = L10n.tr("UI", "global.cancel")
      /// Close
      internal static let close = L10n.tr("UI", "global.close")
      /// OK
      internal static let ok = L10n.tr("UI", "global.ok")
      internal enum Version {
        /// Version %@ (%@)
        internal static func format(_ p1: String, _ p2: String) -> String {
          return L10n.tr("UI", "global.version.format", p1, p2)
        }
      }
    }
  }
  internal enum Welcome {
    internal enum Agreement {
      /// Payment will be charged to your Apple ID account at the confirmation of purchase. Subscription automatically renews unless it is canceled at least 24 hours before the end of the current period. Your account will be charged for renewal within 24 hours prior to the end of the current period. You can manage and cancel your subscriptions by going to your account settings on the App Store after purchase.\n\nSigning up constitutes acceptance of the $1 and the $2.
      internal static let message = L10n.tr("Welcome", "agreement.message")
      internal enum Message {
        /// Privacy Policy
        internal static let privacy = L10n.tr("Welcome", "agreement.message.privacy")
        /// Terms of Service
        internal static let tos = L10n.tr("Welcome", "agreement.message.tos")
      }
      internal enum Trials {
        /// Payment will be charged to your Apple ID account at the confirmation of purchase. Subscription automatically renews unless it is canceled at least 24 hours before the end of the current period. Your account will be charged for renewal within 24 hours prior to the end of the current period. You can manage and cancel your subscriptions by going to your account settings on the App Store after purchase.\n\nCertain Paid Subscriptions may offer a free trial prior to charging your payment method. If you decide to unsubscribe from a Paid Subscription before we start charging your payment method, cancel the subscription at least 24 hours before the free trial ends.\n\nFree trials are only available to new users, and are at our sole discretion, and if you attempt to sign up for an additional free trial, you will be immediately charged with the standard Subscription Fee.\n\nWe reserve the right to revoke your free trial at any time.\n\nAny unused portion of your free trial period will be forfeited upon purchase of a subscription.\n\nSigning up constitutes acceptance of this terms and conditions.
        internal static let message = L10n.tr("Welcome", "agreement.trials.message")
        /// Free trials terms and conditions
        internal static let title = L10n.tr("Welcome", "agreement.trials.title")
      }
    }
    internal enum Camera {
      internal enum Access {
        internal enum Denied {
          /// Enable camera access so you can scan QR codes to redeem a gift card.
          internal static let message = L10n.tr("Welcome", "camera.access.denied.message")
        }
        internal enum Error {
          /// Your device does not support scanning QR codes. Please use a device with a camera.
          internal static let message = L10n.tr("Welcome", "camera.access.error.message")
          /// Camera not available
          internal static let title = L10n.tr("Welcome", "camera.access.error.title")
        }
      }
    }
    internal enum Gdpr {
      internal enum Accept {
        internal enum Button {
          /// Agree and continue
          internal static let title = L10n.tr("Welcome", "gdpr.accept.button.title")
        }
      }
      internal enum Collect {
        internal enum Data {
          /// E-mail Address for the purposes of account management and protection from abuse.\n\nPayment Data for the purposes of processing payments as required by our third-party payment processors. Note that we do not save your full credit card details.
          internal static let description = L10n.tr("Welcome", "gdpr.collect.data.description")
          /// Personal information we collect
          internal static let title = L10n.tr("Welcome", "gdpr.collect.data.title")
        }
      }
      internal enum Usage {
        internal enum Data {
          /// E-mail address is used to send subscription information, payment confirmations, customer correspondence, and Private Internet Access promotional offers only.\n\nPayment data is used to manage client signups, payments, and cancellations.
          internal static let description = L10n.tr("Welcome", "gdpr.usage.data.description")
          /// Uses of personal information collected by us
          internal static let title = L10n.tr("Welcome", "gdpr.usage.data.title")
        }
      }
    }
    internal enum Getstarted {
      internal enum Buttons {
        /// Buy account
        internal static let buyaccount = L10n.tr("Welcome", "getstarted.buttons.buyaccount")
      }
    }
    internal enum Iap {
      internal enum Error {
        /// Error
        internal static let title = L10n.tr("Welcome", "iap.error.title")
        internal enum Message {
          /// Apple servers currently unavailable. Please try again later.
          internal static let unavailable = L10n.tr("Welcome", "iap.error.message.unavailable")
        }
      }
    }
    internal enum Login {
      /// LOGIN
      internal static let submit = L10n.tr("Welcome", "login.submit")
      /// Sign in to your account
      internal static let title = L10n.tr("Welcome", "login.title")
      internal enum Error {
        /// Too many failed login attempts with this username. Please try again later.
        internal static let throttled = L10n.tr("Welcome", "login.error.throttled")
        /// Log in
        internal static let title = L10n.tr("Welcome", "login.error.title")
        /// Your username or password is incorrect.
        internal static let unauthorized = L10n.tr("Welcome", "login.error.unauthorized")
        /// You must enter a username and password.
        internal static let validation = L10n.tr("Welcome", "login.error.validation")
      }
      internal enum Password {
        /// Password
        internal static let placeholder = L10n.tr("Welcome", "login.password.placeholder")
      }
      internal enum Restore {
        /// Didn't receive account details?
        internal static let button = L10n.tr("Welcome", "login.restore.button")
      }
      internal enum Username {
        /// Username (p1234567)
        internal static let placeholder = L10n.tr("Welcome", "login.username.placeholder")
      }
    }
    internal enum Plan {
      /// Best value
      internal static let bestValue = L10n.tr("Welcome", "plan.best_value")
      /// %@/mo
      internal static func priceFormat(_ p1: String) -> String {
        return L10n.tr("Welcome", "plan.price_format", p1)
      }
      internal enum Accessibility {
        /// per month
        internal static let perMonth = L10n.tr("Welcome", "plan.accessibility.per_month")
      }
      internal enum Monthly {
        /// Monthly
        internal static let title = L10n.tr("Welcome", "plan.monthly.title")
      }
      internal enum Yearly {
        /// %@%@ per year
        internal static func detailFormat(_ p1: String, _ p2: String) -> String {
          return L10n.tr("Welcome", "plan.yearly.detail_format", p1, p2)
        }
        /// Yearly
        internal static let title = L10n.tr("Welcome", "plan.yearly.title")
      }
    }
    internal enum Purchase {
      /// Continue
      internal static let `continue` = L10n.tr("Welcome", "purchase.continue")
      /// Submit
      internal static let submit = L10n.tr("Welcome", "purchase.submit")
      /// 7-day money back guarantee
      internal static let subtitle = L10n.tr("Welcome", "purchase.subtitle")
      /// Select a VPN plan
      internal static let title = L10n.tr("Welcome", "purchase.title")
      internal enum Confirm {
        /// You are purchasing the %@ plan
        internal static func plan(_ p1: String) -> String {
          return L10n.tr("Welcome", "purchase.confirm.plan", p1)
        }
        internal enum Form {
          /// Enter your email address
          internal static let email = L10n.tr("Welcome", "purchase.confirm.form.email")
        }
      }
      internal enum Email {
        /// Email address
        internal static let placeholder = L10n.tr("Welcome", "purchase.email.placeholder")
      }
      internal enum Error {
        /// Purchase
        internal static let title = L10n.tr("Welcome", "purchase.error.title")
        /// You must enter an email address.
        internal static let validation = L10n.tr("Welcome", "purchase.error.validation")
        internal enum Connectivity {
          /// We are unable to reach Private Internet Access. This may due to poor internet or our service is blocked in your country.
          internal static let description = L10n.tr("Welcome", "purchase.error.connectivity.description")
          /// Connection Failure
          internal static let title = L10n.tr("Welcome", "purchase.error.connectivity.title")
        }
      }
      internal enum Login {
        /// Sign in
        internal static let button = L10n.tr("Welcome", "purchase.login.button")
        /// Already have an account?
        internal static let footer = L10n.tr("Welcome", "purchase.login.footer")
      }
    }
    internal enum Redeem {
      /// Scan QR
      internal static let scanqr = L10n.tr("Welcome", "redeem.scanqr")
      /// SUBMIT
      internal static let submit = L10n.tr("Welcome", "redeem.submit")
      /// Type in your email address and the %lu digit PIN from your gift card or trial card below.
      internal static func subtitle(_ p1: Int) -> String {
        return L10n.tr("Welcome", "redeem.subtitle", p1)
      }
      /// Redeem gift card
      internal static let title = L10n.tr("Welcome", "redeem.title")
      internal enum Accessibility {
        /// Back
        internal static let back = L10n.tr("Welcome", "redeem.accessibility.back")
      }
      internal enum Email {
        /// Email address
        internal static let placeholder = L10n.tr("Welcome", "redeem.email.placeholder")
      }
      internal enum Error {
        /// Please type in your email and card PIN.
        internal static let allfields = L10n.tr("Welcome", "redeem.error.allfields")
        /// Code must be %lu numeric digits.
        internal static func code(_ p1: Int) -> String {
          return L10n.tr("Welcome", "redeem.error.code", p1)
        }
        /// Redeem
        internal static let title = L10n.tr("Welcome", "redeem.error.title")
        internal enum Qrcode {
          /// Invalid QR code sequence. Please try again.
          internal static let invalid = L10n.tr("Welcome", "redeem.error.qrcode.invalid")
        }
      }
      internal enum Giftcard {
        /// Gift card PIN
        internal static let placeholder = L10n.tr("Welcome", "redeem.giftcard.placeholder")
      }
    }
    internal enum Restore {
      /// CONFIRM
      internal static let submit = L10n.tr("Welcome", "restore.submit")
      /// If you purchased a plan through this app and didn't receive your credentials, you can send them again from here. You will not be charged during this process.
      internal static let subtitle = L10n.tr("Welcome", "restore.subtitle")
      /// Restore uncredited purchase
      internal static let title = L10n.tr("Welcome", "restore.title")
      internal enum Email {
        /// Email address
        internal static let placeholder = L10n.tr("Welcome", "restore.email.placeholder")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
