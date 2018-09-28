//
//  String+Tests.swift
//  ContactsSampleTests
//
//  Created by Shota Nakagami on 2018/09/28.
//  Copyright © 2018年 Shota Nakagami. All rights reserved.
//

import XCTest
@testable import ContactsSample

class String_Tests: XCTestCase {
    func test_isEmailAdress() {
        XCTAssertFalse("a".isEmailAddress)
        XCTAssertFalse("a@".isEmailAddress)
        XCTAssertFalse("@a".isEmailAddress)
        XCTAssertFalse("a@a".isEmailAddress)
        XCTAssertFalse("a@a.a".isEmailAddress)
        XCTAssertFalse("a@a.aaaaa".isEmailAddress)
        XCTAssertFalse("aa.aaa".isEmailAddress)
        XCTAssertFalse("a@aaa".isEmailAddress)
        XCTAssertFalse("あ@a.aa".isEmailAddress)
        
        XCTAssertTrue("a@a.aa".isEmailAddress)
        XCTAssertTrue("a@a.aaa".isEmailAddress)
        XCTAssertTrue("a@a.aaaa".isEmailAddress)
        XCTAssertTrue("contactssample+tests@hoge.come".isEmailAddress)
    }
}
