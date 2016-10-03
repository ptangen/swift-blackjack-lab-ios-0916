//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Paul Tangen on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name:String                 // name, a string
    var cards: [Card] = []          // cards, an array of Card objects
    var handscore: UInt{        // handscore, an unsigned integer
        // Make handscore a calculated property that evaluates the cards array. It may use one Ace as a value of 11 if doing so will not bust the hand.
        var total: UInt = 0
        var acePresent = false
        // calc handscore assuming Ace = 1
        for card in cards {
            total += card.cardValue
            if card.cardLabel.contains("A") {acePresent = true}
        }
        // now increase the value of handscore by 10 if handscore is <= 11 and there is an ace in the hand.
        if (total <= 11 && acePresent) {total += 10}
        
        return total
    }
    var blackjack:Bool {            // blackjack, a boolean
        if cards.count == 2 && handscore == 21 { return true }; return false
    }
    var busted:Bool {               // busted, a boolean,
        if self.handscore > 21 { return true }; return false
    }
    var stayed:Bool = false         // stayed, a boolean
    
    var mayHit:Bool {               // mayHit, a boolean
        if(!busted && !blackjack && !stayed) { return true }; return false
    }
    var tokens:UInt = 100           // tokens, an unsigned integer, and
    var description:String {        // description, a string.
        var listOfCards:String = ""
        for card in cards {
            listOfCards = "\(listOfCards) , \(card.cardLabel)"
        }
        // trim the 3 leading characters
        if listOfCards.characters.count > 0 {
            let startIndex = listOfCards.index(listOfCards.startIndex, offsetBy: 3)
            listOfCards = listOfCards.substring(from: startIndex)
        }
        
        return "Player: \(name)\tcards: \(listOfCards)\thandscore: \(handscore)\nblackjack: \(blackjack)\tbusted: \(busted)\tstayed: \(stayed)\tmayHit: \(mayHit)\ttokens: \(tokens)"
    }
    
    var descriptionShort:String {        // description, a string.
        var listOfCards:String = ""
        for card in cards {
            listOfCards = "\(listOfCards) , \(card.cardLabel)"
        }
        // trim the 3 leading characters
        if listOfCards.characters.count > 0 {
            let startIndex = listOfCards.index(listOfCards.startIndex, offsetBy: 3)
            listOfCards = listOfCards.substring(from: startIndex)
        }
        
        return "Player: \(name)\thandscore: \(handscore)\ttokens: \(tokens)  \tcards: \(listOfCards)"
    }
    
    // Write an initializer which takes an argument for the name property. Make the initial value of the tokens property 100.
    init(name:String) {
        self.name = name
    }
    
    // Write a method called canPlace(bet:) which takes an unsigned integer argument and returns a boolean of whether or not the player can afford the submitted bet.
    func canPlace(bet:UInt) -> Bool {
        if self.tokens >= bet { return true }; return false
    }
    
    // Write two methods called didWin() and didLose() which both take an unsigned integer for the value of the bet and appropriately update the value of tokens.
    func didWin(bet:UInt) {
        self.tokens += bet
    }
    
    func didLose(bet:UInt) {
        self.tokens -= bet
    }
}
