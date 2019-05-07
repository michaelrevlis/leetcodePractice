//
//  36_ValidSudoku.swift
//  LeetCodeTests
//
//  Created by MichaelRevlis on 2019/4/6.
//  Copyright © 2019年 MichaelRevlis. All rights reserved.
//

import XCTest

class _6_ValidSudoku: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFunctions() {
        let m1 = [[Character.init("1"), Character.init("2")],
                  [Character.init("3"), Character.init("4")]]
        let cm1 = convertMatrix(m1)
        assert(m1 == convertMatrix(cm1))
        
        
    }
    
    func testExample() {
        let a1:[[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        XCTAssertTrue(isValidSudoku(a1))
        
        let a2: [[Character]] = [
            ["8","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        XCTAssertFalse(isValidSudoku(a2))
    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        if checkDuplicateMatrix(board) == false {
            return false
        }
        
        let convertedBoard = convertMatrix(board)
        if checkDuplicateMatrix(convertedBoard) == false {
            return false
        }
        
        var array = board
        var t =  first3element(array)
        var m = first3element(t.1)
        var b = m
        
        t = first3element(t.0)
        let t1 = t.0 as! [Character]
        if checkDuplicate(t1) == false { return false }
        
        t = first3element(t.1)
        let t2 = t.0 as! [Character]
        if checkDuplicate(t2) == false { return false }
        
        if checkDuplicate(t.1 as! [Character]) == false { return false }
        
        m = first3element(m.0)
        let m1 = m.0 as! [Character]
        if checkDuplicate(m1) == false { return false }
        
        m = first3element(m.1)
        let m2 = m.0 as! [Character]
        if checkDuplicate(m2) == false { return false }
        
        if checkDuplicate(m.1 as! [Character]) == false { return false }
        
        b = first3element(b.1)
        let b1 = b.0 as! [Character]
        if checkDuplicate(b1) == false { return false }
        
        b = first3element(b.1)
        let b2 = b.0 as! [Character]
        if checkDuplicate(b2) == false { return false }
        
        if checkDuplicate(b.1 as! [Character]) == false { return false }
        
        return true
    }
    
    func checkDuplicateMatrix(_ array:[[Character]]) -> Bool {
        for b in array {
            if checkDuplicate(b) == false {
                return false
            }
        }
        return true
    }
    
    func checkDuplicate(_ array: [Character]) -> Bool {
        var s = Set.init(array)
        s.remove(Character.init("."))
        
        let l = array.filter { (c) -> Bool in
            c != Character.init(".")
        }
        
        return s.count == l.count
    }
    
    func convertMatrix(_ matrix:[[Character]]) -> [[Character]] {
        var result = [[Character]]()
        
        for i in 0..<matrix.count {
            for j in 0..<matrix.count {
                if j >= result.count { result.append([Character]()) }
                result[j].append(matrix[i][j])
            }
        }
        
        return result
    }
    
    func first3element(_ array: Array<Any>) -> (Array<Any>, Array<Any>) {
        var oldArr = array
        var result = [Any]()
        for i in 0...2 {
            result.append(array[i])
            oldArr.removeFirst(1)
        }
        return (result, oldArr)
    }
}
