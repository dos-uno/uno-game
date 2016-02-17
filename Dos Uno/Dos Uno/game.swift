//
//  game.swift
//  Dos Uno
//
//  Created by Rachael Worthington on 2/16/16.
//  Copyright © 2016 Purplellamas. All rights reserved.
//

import Foundation

// this file is intended to hold the game-state for 1 game.
// Games:
// * games should have 2 players (eventually more?)
// * goal is to accumulate 500 pts (adjustable?)
// * game is broken into rounds, at the end of which scores are adjusted
// Rounds:
// * each round will have a hand per player (which can have 1-"many" cards) (sorted?)
// * there will be a deck of face-down cards shuffled
// * there will be a discard stack of face-up cards to play on.

struct User {
    var name:String
    var score:Int
    // icon?

    var hand:[Card]
}

struct Round {
    var deck:Deck
    var discard:[Card]
    var source:[Card]
}

struct Game {
    var users:[User]
    var round:Round
}