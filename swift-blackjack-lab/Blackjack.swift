//
//  File.swift
//  swift-blackjack-lab
//
//  Created by Paul Tangen on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Blackjack {
    
    class func descriptionFor(cardArray: [Card]) -> [String] {
        // This should take in an array of Card objects and return a single string of all the cardLabels in the array, sorted by suit and rank, with each suit on a new line.
        var results: [String] = []
        for card in cardArray {
            results.append(card.cardLabel)
        }
        results.sort()
        return results
    }
    
    class func playBlackjack(withBet bet:UInt) -> String {
        let dealer = Dealer(name: "bob")
        dealer.bet = bet
        dealer.deck.shuffle()
        print("\nStart of the game:\n")
        for i in 1...5 {
            // init
            dealer.house.stayed = false
            dealer.player.stayed = false
            var playersTurn = true
            
            if dealer.player.canPlace(bet: bet) && dealer.house.canPlace(bet: bet) {
                print("Play hand \(i) for \(bet) tokens...")
                dealer.deal()
                //print("\n \(dealer.player.description)")
                //print("\n \(dealer.house.description)")
                // calc stayed
                if dealer.house.handscore > 15 { dealer.house.stayed = true }
                if dealer.house.stayed && dealer.player.handscore > dealer.house.handscore { dealer.player.stayed = true }
                
                while dealer.winner() == "no" { // deal more cards while no winner
                    if playersTurn {
                        dealer.turn(house: dealer.player)
                        playersTurn = false
                    } else {
                        dealer.turn(house: dealer.house)
                        playersTurn = true
                    }
                    // calc stayed after turn
                    if dealer.house.handscore > 15 { dealer.house.stayed = true }
                    if dealer.house.stayed && dealer.player.handscore > dealer.house.handscore { dealer.player.stayed = true }
                }
                
                
                print(dealer.award())
                
                print("\(dealer.player.descriptionShort)")
                print("\(dealer.house.descriptionShort)")
                
            } else {
                print( "\nInsufficient funds.\n")
                break
            }
            print("\n")
        }// close for loop
        return ""
    }

}
