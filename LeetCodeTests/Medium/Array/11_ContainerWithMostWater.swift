//
//  11_ContainerWithMostWater.swift
//  LeetCodeTests
//
//  Created by MichaelRevlis on 2019/4/5.
//  Copyright © 2019年 MichaelRevlis. All rights reserved.
//

import XCTest

class _1_ContainerWithMostWater: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let input = [1,8,6,2,5,4,8,3,7]
        let output = 49
        assert(maxArea(input) == output)
    }
    
    func maxArea(_ height: [Int]) -> Int {
        
        var l = 0, r = height.count-1, currentMax = 0
        
        while l < r {
            currentMax = max(currentMax, (r-l)*min(height[l], height[r]))
            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        
        return currentMax
    }

    func maxArea2(_ height: [Int]) -> Int {
        
        var currentMax = (1 - 0) * min(height[0], height[1])
        
        for i in 0..<height.count {
            
            for j in (i+1)..<height.count {
                let current = (j - i) * min(height[i], height[j])
                if current > currentMax {
                    currentMax = current
                }
            }
        }
        
        return currentMax
    }

}
