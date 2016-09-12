//
//  AlteranTests.swift
//  AlteranTests
//
//  Created by Milot Shala on 9/7/16.
//  Copyright © 2016 Milot Shala. All rights reserved.
//

import XCTest
@testable import Alteran

class AlteranTests: XCTestCase {
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	func testDefaultLanguage() {
		print(Alteran.availableLanguages().count)
		XCTAssert(Alteran.currentLanguage() == "en", "Should be English")
	}
	
}
