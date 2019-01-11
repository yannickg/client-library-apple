//
//  TileableCell.swift
//  PIA VPN
//
//  Created by Jose Antonio Blaya Garcia on 11/01/2019.
//  Copyright © 2019 London Trust Media. All rights reserved.
//

import Foundation

public protocol EditableTileCell {
    
    func setupCellForStatus(_ status: TileStatus)
    
}

public protocol DetailedTileCell: EditableTileCell {
    
    func hasDetailView() -> Bool
    func segueIdentifier() -> String?
    func highlightCell()
    func unhighlightCell()

}

public protocol TileableCell: DetailedTileCell {
    
    associatedtype Entity
    var tileType: AvailableTiles {get}
    
}

public extension TileableCell where Entity: Tileable {
    
    func hasDetailView() -> Bool {
        return false
    }
    
    func segueIdentifier() -> String? {
        return nil
    }

    
    func highlightCell() {
    }
    
    func unhighlightCell() {
    }
    
}
