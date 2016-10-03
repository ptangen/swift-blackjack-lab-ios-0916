//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
        
    // needed by player to set stayed property
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let game = Blackjack.playBlackjack(withBet: 10)
        print(game)
        
        // Do not alter
        return true  //
    }   ///////////////

    // Write a method called playBlackjack(withBet:) that calls the different steps in the game in order. The player and house should be offered a maximum of five cards total.
    

    
}

