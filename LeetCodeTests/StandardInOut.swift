//
//  StandardInOut.swift
//  LeetCodeTests
//
//  Created by MichaelRevlis on 2019/4/14.
//  Copyright © 2019 MichaelRevlis. All rights reserved.
//

import XCTest

class StandardInOut: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        self.defaultValueForFunc()
        self.defaultValueForFunc(3)
        self.defaultValueForFunc(b:4)
        self.defaultValueForFunc(5, b: 6)
    }

    func defaultValueForFunc(_ a:Int = 1, b:Int = 2) {
        print("a:\(a), b:\(b)")
    }

}
