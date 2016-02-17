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
    
    func testDeckGeneration() {
        let gameDeck:[Card] = generateDeck()

        XCTAssert(gameDeck.count == 108)
        // we should probably sort the array we get back & make sure all hte right cards are here, as part of this test, too.

        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
