//
//  12_IntegerToRoman.swift
//  LeetCodeTests
//
//  Created by MichaelRevlis on 2019/5/2.
//  Copyright © 2019 MichaelRevlis. All rights reserved.
//

import XCTest

/*  2019.5.2
 Runtime: 32 ms, faster than 100.00% of Swift online submissions for Integer to Roman.
 Memory Usage: 19.1 MB, less than 7.69% of Swift online submissions for Integer to Roman.
 */
class _2_IntegerToRoman: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        XCTAssertEqual(self.intToRoman(3), "III")
        XCTAssertEqual(self.intToRoman(4), "IV")
        XCTAssertEqual(self.intToRoman(9), "IX")
        XCTAssertEqual(self.intToRoman(58), "LVIII")
        XCTAssertEqual(self.intToRoman(1994), "MCMXCIV")
    }
    
    func intToRoman(_ num: Int) -> String {
        var result = ""
        
        if num >= 1000 {
            let n = num/1000
            result += self.numberToRoman(n, symbolFor1: "M", symbolFor5: "", symbolFor10: "")
        }
        
        if num >= 100 {
            let r = num % 1000
            let n = r/100
            result += self.numberToRoman(n, symbolFor1: "C", symbolFor5: "D", symbolFor10: "M")
        }
        
        if num >= 10 {
            let r = num % 100
            let n = r/10
            result += self.numberToRoman(n, symbolFor1: "X", symbolFor5: "L", symbolFor10: "C")
        }
        
        let n = num % 10
        result += self.numberToRoman(n, symbolFor1: "I", symbolFor5: "V", symbolFor10: "X")
        
        return result
    }
    
    func numberToRoman(_ n:Int, symbolFor1 one:String = "", symbolFor5 five:String = "", symbolFor10 ten:String = "") -> String {
        var result = ""
        
        switch n {
        case 1...3:
            for _ in 1...n {
                result += one
            }
        case 4:
            result = "\(one)\(five)"
        case 5:
            result = five
        case 6...8:
            result = five
            for _ in 1...(n-5) {
                result += one
            }
        case 9:
            result = "\(one)\(ten)"
        default:
            result = ""
        }
        
        return result
    }
    
}
