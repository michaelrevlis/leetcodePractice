//
//  16_3SumClosest.swift
//  LeetCodeTests
//
//  Created by MichaelRevlis on 2019/4/5.
//  Copyright © 2019年 MichaelRevlis. All rights reserved.
//

import XCTest

class _6_3SumClosest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let ans = threeSumClosest([-1, 2, 1, -4], 1)
        assert(ans == 2)
        let ans2 = threeSumClosest([0,1,2], 3)
        assert(ans2 == 3)
        let ans3 = threeSumClosest([0,1,2,-3], 1)
        assert(ans3 == 0)
    }

    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {

        var array = nums.map { (abs($0 - target), $0 - target > 0 ? 1:-1) }
        array = array.sorted(by: {$0.0 < $1.0})
        
        var result = 0
        
        for i in 0...2 {
            let a = array[i]
            result += (a.0 + target*a.1)*a.1
        }
        
        return result
    }

}
