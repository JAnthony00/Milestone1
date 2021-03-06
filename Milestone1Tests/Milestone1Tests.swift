//
//  Milestone1Tests.swift
//  Milestone1Tests
//
//  Created by Jack Brighton on 30/3/22.
//

import XCTest
@testable import Milestone1

class Milestone1Tests: XCTestCase {
    
    //checks the declared variables of Item
    func testItem() {
        let testItem = Item(name: "itemName", isChecked: true)
        XCTAssertEqual("itemName", testItem.name)
        XCTAssertEqual(true, testItem.isChecked)
    }
    //changes the name of an item and checks that it remains changed
    func testName() {
        var testItem = Item(name: "itemName", isChecked: true)
        testItem.name = "New name"
        XCTAssertEqual(testItem.name, "New name")
    }
    
    //changes is checked of item and checks that it remains changed
    func testIsChecked() {
        var testItem = Item(name: "itemName", isChecked: true)
        testItem.isChecked = false
        XCTAssertEqual(testItem.isChecked, false)
    }
    
    //
    
    
    
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
