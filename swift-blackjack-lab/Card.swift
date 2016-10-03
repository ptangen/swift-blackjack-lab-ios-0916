//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Paul Tangen on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit: String            // suit, a string,
    var rank: String            // rank, a string,
    var cardLabel: String       // cardLabel, a string, and
    var cardValue: UInt   = 0      // cardValue, an unsigned integer.
    var description: String {
        return self.cardLabel
    }
    
    
    // Write an initializer for Card that takes two arguments for suit and rank.
    // It should also set the cardLabel property to string containing both the suit and the rank in the form of ♠︎A (for the Ace of Spades).
    // It should also set the cardValue property appropriately for scoring Blackjack: Aces are worth one, number cards are worth their face values, and face cards are worth ten.
    
    init(suit:String, rank:String){
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(self.suit)\(self.rank)"
        self.cardValue = determineCardValue(rankPassed:rank)
    }
    
    func determineCardValue(rankPassed: String) -> UInt {
        if rankPassed == "A" {
            return UInt(1)
        } else if rankPassed == "K" || rankPassed == "Q" || rankPassed == "J" {
            return UInt(10)
        } else {
            return UInt(self.rank)!
        }
    }
    
    // Set up two class methods called validSuits and validRanks that return arrays containing the four suit icons and the thirteen string representations of the ranks (Ace through King).
    
    func validSuits() -> [String] {
        return ["♠︎",  "♥︎",  "♦︎", "♣︎"]
    }
    
    func validRanks() -> [String] {
        return ["A",  "K",  "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
    }
}
