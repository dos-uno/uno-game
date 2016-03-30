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

struct User: Equatable {
    var name:String
    var score:Int
    // icon?

    var hand:[Card]
}

func ==(user1: User, user2: User) -> Bool {
    return user1.name == user2.name && user1.score == user2.score
}

struct Round {
    var deck:[Card]
    var discard:[Card]
    var source:[Card]
    let winner:User?
}

struct Game {
    var users:[User]
    var round:Round?

    mutating func newRound() {
        guard round == nil else {
            self.completeRound();
            return;
        }
        var deck = generateDeck()
        let discard = [deck.removeFirst()]
        for var user in users {
            for _ in 1...7 {
                user.hand.append(deck.removeFirst())
            }
        let source = deck
        round = Round(deck: deck, discard: discard, source: source, winner: nil)

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
        if let localRound = round, var winner = localRound.winner {
            var roundScore = 0
            for user in users {
                roundScore += handTotal(user.hand)
            }
            winner.score += roundScore
        }
    }
}