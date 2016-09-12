//
//  AlteranExampleTests.swift
//  AlteranExampleTests
//
//  Created by Milot Shala on 9/12/16.
//  Copyright © 2016 Milot Shala. All rights reserved.
//

import XCTest
@testable import AlteranExample
@testable import Alteran

class AlteranExampleTests: XCTestCase {
	
	override func setUp() {
		super.setUp()
		Alteran.resetCurrentLanguageToDefault()
	}
	
	override func tearDown() {
		Alteran.resetCurrentLanguageToDefault()
		super.tearDown()
	}
	
	func testAvailableLanguages() {
		XCTAssert(Alteran.availableLanguages().count == 2, "Should contain two languages, English and Albanian.")
	}
	
	func testDefaultLanguage() {
		XCTAssert(Alteran.defaultLanguage() == "en", "Should be set to English.")
	}
	
	func testLanguageChange() {
		XCTAssert(Alteran.currentLanguage() == "en", "Current unswitched language should be English.")
		Alteran.setCurrent(language: "sq")
		XCTAssert(Alteran.currentLanguage() == "sq", "Language switching should be done by now.")
	}
	
	func testNonExistentLanguageChange() {
		XCTAssert(Alteran.currentLanguage() == "en", "Current unswitched language should be English.")
		Alteran.setCurrent(language: "sq")
		XCTAssert(Alteran.currentLanguage() == "sq", "Language switching should be done by now.")
		Alteran.setCurrent(language: "fr")
		XCTAssert(Alteran.currentLanguage() != "fr", "Language switching should be done by now.")
	}
	
	func testDisplayNameInEnglish() {
		XCTAssert(Alteran.displayNameFor(language: "en") == "English", "Should write 'English'")
		XCTAssert(Alteran.displayNameFor(language: "sq") == "Albanian", "Should write 'Albanian'")
		XCTAssert(Alteran.displayNameFor(language: "fr") == "French", "Should write 'French'")
	}
	
	func testDisplayNameInAlbanian() {
		Alteran.setCurrent(language: "sq")
		XCTAssert(Alteran.displayNameFor(language: "en") == "anglisht", "Should write 'anglisht'")
		XCTAssert(Alteran.displayNameFor(language: "sq") == "shqip", "Should write 'shqip'")
		XCTAssert(Alteran.displayNameFor(language: "fr") == "frëngjisht", "Should write 'frëngjisht'")
	}
	
}
