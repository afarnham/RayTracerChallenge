//
//  RayTracerChallengeTests.swift
//  RayTracerChallengeTests
//
//  Created by Raymond Farnham on 3/3/19.
//  Copyright © 2019 Raymond Farnham. All rights reserved.
//

import XCTest
@testable import RayTracerChallenge

class TupleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func runTestTupleIsAPoint(tuple: RTTuple) {
        XCTAssert(tuple.w == 1.0)
    }
    
    func runTestTupleIsNotAPoint(tuple: RTTuple) {
        XCTAssert(tuple.w != 1.0)
    }
    
    
    func runTestTupleIsAVector(tuple: RTTuple) {
        XCTAssert(tuple.w == 0)
    }
    
    func runTestTupleIsNotAVector(tuple: RTTuple) {
        XCTAssert(tuple.w != 0)
    }
    
    func testTupleIsAPoint() {
        let a: RTTuple = (4.3, -4.2, 3.1, 1.0)
        XCTAssert(a.x.isEqual(to: 4.3))
        XCTAssert(a.y.isEqual(to: -4.2))
        XCTAssert(a.z.isEqual(to: 3.1))
        XCTAssert(a.w.isEqual(to: 1.0))
        runTestTupleIsAPoint(tuple: a)
        runTestTupleIsNotAVector(tuple: a)
    }
    
    func testTupleIsAVector() {
        let a: RTTuple = (4.3, -4.2, 3.1, 0)
        XCTAssert(a.x.isEqual(to: 4.3))
        XCTAssert(a.y.isEqual(to: -4.2))
        XCTAssert(a.z.isEqual(to: 3.1))
        XCTAssert(a.w.isEqual(to: 0.0))
        runTestTupleIsNotAPoint(tuple: a)
        runTestTupleIsAVector(tuple: a)
    }
    
    func testPointCreatesTuplesWithW1() {
        let p = point(4, -4, 3)
        let expected: RTTuple = (4, -4, 3, 1)
        XCTAssert(p == expected)
    }
    
    func testVectorCreatesTuplesWithW0() {
        let v = vector(4, -4, 3)
        let expected: RTTuple = (4, -4, 3, 0)
        XCTAssert(v == expected)
    }
    
    func testAddingTwoTuples() {
        let a1: RTTuple = (3, -2, 5, 1)
        let a2: RTTuple = (-2, 3, 1, 0)
        let r = a1 + a2
        XCTAssert(r == rttuple(1, 1, 6, 1))
    }
    
    func testSubtractingTwoPoint() {
        let p1 = point(3, 2, 1)
        let p2 = point(5, 6, 7)
        let r = p1 - p2
        XCTAssert(r == vector(-2, -4, -6))
    }
    
    func testSubtractingAVectorFromAPoint() {
        let p = point(3, 2, 1)
        let v = vector(5, 6, 7)
        let r = p - v
        XCTAssert(r == point(-2, -4, -6))
    }
    
    func testSubtractingTwoVectors() {
        let v1 = vector(3, 2, 1)
        let v2 = vector(5, 6, 7)
        let r = v1 - v2
        XCTAssert(r == vector(-2, -4, -6))
    }
    
    func testSubtractingAVectorFromTheZeroVector() {
        let zero = vector(0, 0, 0)
        let v = vector(1, -2, 3)
        let r = zero - v
        XCTAssert(r == vector(-1, 2, -3))
    }
    
    func testNegatingATuple() {
        let a = rttuple(1, -2, 3, -4)
        XCTAssert(-a == rttuple(-1, 2, -3, 4))
    }

    func testMutliplyingATupleByAScalar() {
        let a = rttuple(1, -2, 3, -4)
        let r = a * 3.5
        XCTAssert(r == rttuple(3.5, -7, 10.5, -14))
    }
    
    func testMultiplyingATupleByAFraction() {
        let a = rttuple(1, -2, 3, -4)
        let r = a * 0.5
        XCTAssert(r == rttuple(0.5, -1, 1.5, -2))
    }
    
    func testDividingATupleByAScalar() {
        let a = rttuple(1, -2, 3, -4)
        let r = a / 2
        XCTAssert(r == rttuple(0.5, -1, 1.5, -2))
    }
    
    func testComputeMagnitudeOfVector() {
        let v1 = vector(1, 0, 0)
        let r1 = magnitude(v1)
        XCTAssert(r1 == 1)
        
        let v2 = vector(0, 1, 0)
        let r2 = magnitude(v2)
        XCTAssert(r2 == 1)

        let v3 = vector(0, 0, 1)
        let r3 = magnitude(v3)
        XCTAssert(r3 == 1)

        let v4 = vector(1, 2, 3)
        let r4 = magnitude(v4)
        XCTAssert(r4 == sqrt(14))

        let v5 = vector(-1, -2, -3)
        let r5 = magnitude(v5)
        XCTAssert(r5 == sqrt(14))
        
    }
}
