//
//  560_SubarraySumEqualsK.swift
//  LeetCodeTests
//
//  Created by MichaelRevlis on 2019/5/2.
//  Copyright © 2019 MichaelRevlis. All rights reserved.
//

import XCTest

class _60_SubarraySumEqualsK: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        XCTAssertEqual(subarraySum([1,1,1], 2), 2)
        XCTAssertEqual(subarraySum([1,0,0], 1), 3)
        XCTAssertEqual(subarraySum([3,4,7,2,-3,1,4,2], 7), 4)
        XCTAssertEqual(subarraySum([0,0,0,0,0,0,0,0,0,0], 0), 55)
        XCTAssertEqual(subarraySum([1], 0), 0)
    }
    
    /*
     Runtime: 1328 ms, faster than 37.58% of Swift online submissions for Subarray Sum Equals K.
     Memory Usage: 19.2 MB, less than 85.71% of Swift online submissions for Subarray Sum Equals K.
     */
    func subarraySum1(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        
        for i in 0..<nums.count {
            var temp = 0
            
            for j in i..<nums.count {
                temp += nums[j]
                
                if temp == k {
                    count += 1
                }
                
            }
        }
        
        return count
    }
    
    
    /*
     Runtime: 104 ms, faster than 98.66% of Swift online submissions for Subarray Sum Equals K.
     Memory Usage: 20.1 MB, less than 14.29% of Swift online submissions for Subarray Sum Equals K.
     */
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var dict = [0:1]
        var sum = 0
        
        for i in 0..<nums.count {
            sum += nums[i]
            
            // a跟b之間的距離為k
            // dict[k]已存在表示sum[j]存在。i>j, sum[i] ＝a, sum[j] = b, a - b == k
            // 不只是+1而是+d，因為d代表的是i之前加總為0的subarray組合數量
            if let d = dict[sum-k] {
                count = count + d
                
            }
            
            if let c = dict[sum] {
                dict[sum] = c + 1
                
            } else {
                dict[sum] = 1
                
            }
        }
        
        return count
    }
}
