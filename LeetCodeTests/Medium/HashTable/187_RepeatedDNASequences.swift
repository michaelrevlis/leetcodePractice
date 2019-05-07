//
//  187_RepeatedDNASequences.swift
//  LeetCodeTests
//
//  Created by MichaelRevlis on 2019/4/8.
//  Copyright © 2019年 MichaelRevlis. All rights reserved.
//

import XCTest

class _87_RepeatedDNASequences: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let i1 = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
        let o1 = findRepeatedDnaSequences(i1)
        print(o1)
        XCTAssertTrue(o1 == ["CCCCCAAAAA", "AAAAACCCCC"])
        
        let i2 = "AAAAAAAAAAA"
        let o2 = findRepeatedDnaSequences(i2)
        print(o2)
        XCTAssertTrue(o2 == ["AAAAAAAAAA"])
        
        let i3 = "CAAAAAAAAAC"
        let o3 = findRepeatedDnaSequences(i3)
        XCTAssertTrue(o3 == [])
    }

    func findRepeatedDnaSequences(_ s: String) -> [String] {
        if s.count < 11 { return [] }
        
        var array = Array(s)
        var ss = array[0...9]
        array.removeFirst(10)
        var dict: [ArraySlice<Character>: Int] = [ss: 1]

        repeat  {
            ss.removeFirst(1)
            ss.append(array.first!)
            array.removeFirst(1)

            if let _ = dict[ss] {
                dict[ss] = 2
            } else {
                dict[ss] = 1
            }
            
        } while array.count > 0
        
        return dict.compactMap({ (key: ArraySlice<Character>, value: Int) -> String? in
            value == 2 ? String(key) : nil
        })
    }
}
