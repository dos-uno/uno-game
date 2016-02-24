//
//  Dos_UnoTests.swift
//  Dos UnoTests
//
//  Created by Rachael Worthington on 2/2/16.
//  Copyright © 2016 Purplellamas. All rights reserved.
//

import XCTest
@testable import Dos_Uno

class Dos_UnoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func removeAndCompareFrom(deck: [Card], color: Color, value: Value, count: Int) -> [Card] {
        var mutableDeck = deck
        count.times {
            let nextCard = mutableDeck.removeFirst()
            XCTAssert(nextCard.color == color)
            XCTAssert(nextCard.value == value)
        }
        return mutableDeck
    }

    func testDeckGeneration() {

        var gameDeck:[Card] = generateDeck()

        XCTAssert(gameDeck.count == 108)
        // we should probably sort the array we get back & make sure all hte right cards are here, as part of this test, too.
        gameDeck.sortInPlace { (card1, card2) -> Bool in
            if card1.color > card2.color {
                return false
            } else if card1.color < card2.color {
                return true
            } else {
                return card1.value < card2.value
            }
        }
        debugPrint(gameDeck)
        /*
        The deck consists of 108 cards, of which there are twenty-five of each color (red, green, blue, and yellow), each color having two of each rank except zero (and 1 each of zeros). The ranks in each color are zero to nine, "Skip", "Draw Two" and "Reverse" (the last three of these being classified as "action cards"). In addition, the deck contains four each of "Wild" and "Wild Draw Four" cards.

        */
        for color in Color.allValues {
            if color != .all {
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.zero, count:1)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.one, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.two, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.three, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.four, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.five, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.six, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.seven, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.eight, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.nine, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.skip, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.drawTwo, count:2)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.reverse, count:2)
            } else {
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value:.wild, count:4)
                gameDeck = removeAndCompareFrom(gameDeck, color: color, value: .drawFour, count: 4)
            }
        }

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
