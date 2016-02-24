//
//  deck.swift
//  Dos Uno
//
//  Created by Rachael Worthington on 2/7/16.
//  Copyright © 2016 Purplellamas. All rights reserved.
//

import Foundation
import GameplayKit

enum Color: Int, Comparable {
    case red = 0
    case blue = 1
    case green = 2
    case yellow = 3
    case all = 4

    static let allValues: [Color] = {
        return (0...4).map { Color(rawValue: $0)! }
    }()
}

func ==(color1: Color, color2: Color) -> Bool {
    return color1.rawValue == color2.rawValue
}

func <(color1: Color, color2: Color) -> Bool {
    return color1.rawValue < color2.rawValue
}

/*
The deck consists of 108 cards, of which there are twenty-five of each color (red, green, blue, and yellow), each color having two of each rank except zero (and 1 each of zeros). The ranks in each color are zero to nine, "Skip", "Draw Two" and "Reverse" (the last three of these being classified as "action cards"). In addition, the deck contains four each of "Wild" and "Wild Draw Four" cards.

*/
enum Value: Int, Comparable {
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
        return (0...14).map { Value(rawValue: $0)! }
    }()
}

func ==(value1: Value, value2: Value) -> Bool {
    return value1.rawValue == value2.rawValue
}

func <(value1: Value, value2: Value) -> Bool {
    return value1.rawValue < value2.rawValue
}

class Card: CustomDebugStringConvertible {
    var color: Color
    var value: Value
    var debugDescription: String {
        get {
            return "\(color) \(value)"
        }

    }

    init(color: Color, value: Value) {
        self.color = color
        self.value = value
    }
}

extension Int {
    func times(block: () -> ()) {
        for _ in 0..<self {
            block()
        }
    }
}

func generateDeck() -> [Card] {
    var deck: [Card] = []

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
                deck.append(Card(color: .all, value: value))
            }
        case Value.drawFour:
            4.times {
                deck.append(Card(color: .all, value: value))
            }
            // this is 1 - 9, skip, drawTwo, reverse
        default:
            2.times {
                deck.append(Card(color: .red, value: value))
                deck.append(Card(color: .blue, value: value))
                deck.append(Card(color: .green, value: value))
                deck.append(Card(color: .yellow, value: value))
            }
        }
    }
    return GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(deck) as! [Card] // this cast is fine because I put an array of cards in, there's no way to get anything not an array of cards out.

}
