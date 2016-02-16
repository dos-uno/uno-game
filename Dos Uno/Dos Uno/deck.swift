//
//  deck.swift
//  Dos Uno
//
//  Created by Rachael Worthington on 2/7/16.
//  Copyright © 2016 Purplellamas. All rights reserved.
//

import Foundation

enum Color {
    case red
    case blue
    case green
    case yellow
    case all
}

/*
The deck consists of 108 cards, of which there are twenty-five of each color (red, green, blue, and yellow), each color having two of each rank except zero (and 1 each of zeros). The ranks in each color are zero to nine, "Skip", "Draw Two" and "Reverse" (the last three of these being classified as "action cards"). In addition, the deck contains four each of "Wild" and "Wild Draw Four" cards.

*/
enum Value:Int {
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case skip = 10
    case drawTwo = 11
    case reverse = 12

    case wild = 13
    case drawFour = 14

    static let allValues: [Value] = {
        return (0..<14).map { Value(rawValue: $0)! }
    }()
}

struct Card {
    var color:Color
    var value:Value


}

extension Int {
    func times(block: () -> ()) {
        for _ in 0..<self {
            block()
        }
    }
}

struct Deck {
    var deck:[Card] = []
    mutating func generateDeck() {
        assert(deck.isEmpty == true)


        for value in Value.allValues {

            switch value {
            case Value.zero:
                deck.append(Card(color: .red, value: value))
                deck.append(Card(color: .blue, value: value))
                deck.append(Card(color: .green, value: value))
                deck.append(Card(color: .yellow, value: value))
            case Value.wild:
                4.times {
                    self.deck.append(Card(color: .all, value: value))
                }
            case Value.drawFour:
                4.times {
                    self.deck.append(Card(color: .all, value: value))
                }
                // this is 1 - 9, skip, drawTwo, reverse
            default:
                2.times {
                    self.deck.append(Card(color: .red, value: value))
                    self.deck.append(Card(color: .blue, value: value))
                    self.deck.append(Card(color: .green, value: value))
                    self.deck.append(Card(color: .yellow, value: value))
                }
            }
        }
    }
}


