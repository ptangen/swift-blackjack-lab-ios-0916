//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Paul Tangen on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House : Player {
    
    // Override the superclass's initializer to set the wallet property to 1000.
    
    // Add a calculated property mustHit that returns a boolean of whether the house must take a new card or not. Treat the "house rules" as staying at a score of seventeen (17).
    var mustHit: Bool {
        return handscore < 17
        
//        if self.handscore > 15 { return true }; return false
    }
    
    override init(name: String) {
        super.init(name: name)
        if name == "House" {
            self.tokens = 1000
        } else {
            self.tokens = 100
        }
    }
}
