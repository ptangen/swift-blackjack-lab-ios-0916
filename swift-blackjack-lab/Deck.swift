//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Paul Tangen on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    // It should have two private array properties for holding cards: one for holding the remaining (undealt) cards, and the other for holding the dealt cards. The test file cannot see them so name them yourself.
    var undealt:[Card] = []
    var dealt:[Card] = []
    var description:String {
        // Add a description string property that can be used to print information regarding the cards to the console. This string will need to contain information about the remaining cards and dealt cards.
        return "Cards Remaining: \(undealt.count). Cards Dealt: \(dealt.count)"
    }
    
    var allCards:String {
        var descUndealtCardLabelsArr:[String] = Blackjack.descriptionFor(cardArray: undealt)
        descUndealtCardLabelsArr.sort()
        var descDealtCardLabelsArr:[String] = Blackjack.descriptionFor(cardArray: dealt)
        descDealtCardLabelsArr.sort()
        let descUndealtCardLabels = descUndealtCardLabelsArr.joined(separator:", ")
        let descDealtCardLabels = descDealtCardLabelsArr.joined(separator:", ")
        
        return "Undealt cards: \(descUndealtCardLabels) and dealt cards: \(descDealtCardLabels)" // create string from array
    }
    
    // Write an initializer that generates the 52 unique cards required for modeling a standard 52-card deck. It should hold them in the array of cards that can be dealt.
    init() {
        
        let validSuits = ["♣︎", "♠︎",  "♥︎",  "♦︎"]
        let validRanks = ["K",  "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2", "A"]
        
        for suit in 0...validSuits.count-1 {
            for rank in 0...validRanks.count-1 {
                let newCard = Card(suit: validSuits[suit], rank: validRanks[rank])
                self.undealt.append(newCard)
            }
        }
    }
    
    //Write a drawCard() function to return the next card. It should remove that card from the remaining cards and add it to the dealt cards.
    func drawCard() -> Card {
        let nextCardPosition = 0 // should this be random?
        let nextCard = self.undealt[nextCardPosition]
        self.dealt.append(nextCard)
        self.undealt.remove(at: nextCardPosition)
        return nextCard
    }
    
    // Write a shuffle() method that gathers up the dealt cards and randomizes all 52 cards.
    func shuffle() {
        self.undealt = self.undealt + self.dealt
        
        for _ in 0...500 {
            let randomValue = Int(arc4random_uniform(UInt32(51)))
            let currentCard = self.undealt[randomValue]
            self.undealt.remove(at: randomValue)
            self.undealt.append(currentCard)
        }
    }
}
