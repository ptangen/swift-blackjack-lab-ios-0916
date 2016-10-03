//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Paul Tangen on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer : Player{
    var deck:Deck       // a Deck called deck,
    var house:House     // a House called house and named "House",
    var player:House    // a House called player and named "Player", and
    var bet:UInt = 0    // an unsigned integer called bet which starts at zero.
    
    override init (name:String) {
        self.deck = Deck()
        self.house = House(name: "House")
        self.player = House(name: "Player")
        super.init(name: name)
    }
    

    // Write a method called place(bet:) which takes an unsigned integer argument and returns a boolean of whether or not the house and the player can both afford the submitted bet.     
    func place(bet:UInt) -> Bool {
        if super.canPlace(bet: bet) {
            self.bet = bet
            return true
        }
        return false
        // this ref to canPlace and tokens forced me to subclass the player class
    }
    
    // Write a method called deal() that deals a new round, giving two new cards each to the player and to the house.
    func deal() {
        // clear any cards either player may have
        player.cards.removeAll()
        house.cards.removeAll()
        player.stayed = false
        house.stayed = false
        for _ in 0 ... 1 {
            player.cards.append(deck.undealt[0])
            deck.dealt.append(deck.undealt[0])
            deck.undealt.remove(at: 0)
            
            house.cards.append(deck.undealt[0])
            deck.dealt.append(deck.undealt[0])
            deck.undealt.remove(at: 0)
        }
    }
    
    // Write a method called turn() which takes a House argument (since in this console version both the house and the player will be used with this method). If the House object is allowed to take a card, it should be asked if it wishes to hit or stay. If the House object wishes to hit, the dealer should then give it a card. If the House object wishes to stay, then the decision to stay should be recorded.
    
    func turn(house: House) {
        if !house.stayed && !house.busted && !house.blackjack && house.mustHit {
                house.cards.append(deck.undealt[0])
                deck.dealt.append(deck.undealt[0])
                deck.undealt.remove(at: 0)
        }
    }
    
    // Write a method called winner() which returns a string containing the result of the round. It should:
//    return "player" if the player wins,
//    return "house" if the house wins, and
//    return "no" if there is not yet a winner.
//    Keep in mind that:
//    a bust is an immediate victory for the other player,
//    the house wins ties, and
//    the player can win by holding five cards that are not a bust.
    
    func winner() -> String {
        // busted?
        if self.player.busted {
            return "house"
        } else if self.house.busted {
            return "player"
        } else if self.house.blackjack {
            return "house"
        } else if self.player.blackjack {
            return "player"
        } else if self.player.cards.count == 5 {
            return "player"
        } else if !self.player.stayed || !self.house.stayed {
            return "no"
        } else if self.house.handscore >= self.player.handscore {
            return "house"
        } else {
            return "player" }
    }
    
    // Write a method called award() that uses the result of the winner() method to award the bet to the winner of the round. It should add the value of the bet to the winning player and subtract the value of the bet from the losing player. The award() method should also return a string message expressing the result of the round in a phrase or sentence.
    
    //func award(results winnerResult: String) -> String {
    func award() -> String {
        if self.winner() == "house" {
            self.player.didLose(bet: self.bet)
            self.house.didWin(bet: self.bet)
            return "The house wins the hand."
        } else if self.winner() == "player" {
            self.player.didWin(bet: self.bet)
            self.house.didLose(bet: self.bet)
            return "The player wins the hand."
        } else {
            return "No winner yet."
        }
    }
}
