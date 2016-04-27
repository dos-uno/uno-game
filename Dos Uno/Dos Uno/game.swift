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

class User: Equatable {
    var name:String = "Player"
    var score:Int = 0
    // icon?

    var hand:[Card] = []
    
    init (name: String, score: Int, hand: [Card]) {
        self.name = name
        self.score = score
        self.hand = hand
        
    }
}

func ==(user1: User, user2: User) -> Bool {
    return user1.name == user2.name && user1.score == user2.score
}

class Round {
    var discard:[Card]
    var source:[Card]
    let winner:User? = nil

    init (discard: [Card], source: [Card]) {
        self.discard = discard
        self.source = source
    }
}

class Game {
    var users:[User]
    var round:Round?

    init (users: [User], round: Round? = nil) {
        self.users = users
        self.round = round
    }

    func newRound() {
        guard round == nil else {
            self.completeRound();
            return;
        }

        var source = generateDeck()
        let discard = [source.removeFirst()]
        for user in users {
            for _ in 1...7 {
                user.hand.append(source.removeFirst())
            }
            round = Round(discard: discard, source: source)

        }
    }

    func winner() -> User? {
        for user in users {
            if user.score >= 500 {
                return user;
            }
        }

        return nil;
    }

    func handTotal(hand:[Card]?) -> Int {
        guard hand != nil else {
            return 0
        }
        var total = 0
        for card in hand! {
            total += card.value.rawValue
        }
        return total
    }

    func completeRound() {
        if let localRound = round, winner = localRound.winner {
            var roundScore = 0
            for user in users {
                roundScore += handTotal(user.hand)
            }
            winner.score += roundScore
        }
    }
}