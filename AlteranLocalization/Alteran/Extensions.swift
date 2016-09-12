//
//  Extensions.swift
//  Alteran
//
//  Created by Milot Shala on 9/7/16.
//  Copyright © 2016 Milot Shala. All rights reserved.
//

import Foundation

/*
		Swift 2.x-friendly String extension to the Functions used before, this enables the use of "Hello World".localized() syntax.
    This way you can get all the localized strings.
*/
public extension String {
	func alteranLocalized() -> String {
		if let path = Bundle.main.path(forResource: Alteran.currentLanguage(), ofType: "lproj"),
			let bundle = Bundle(path: path) {
			return bundle.localizedString(forKey: self, value: nil, table: nil)
		}
		else if let path = Bundle.main.path(forResource: ALTBase, ofType: "lproj"),
			let bundle = Bundle(path: path) {
			return bundle.localizedString(forKey: self, value: nil, table: nil)
		}
		return self
	}
	
	func alteranLocalizedFormat(_ arguments: CVarArg...) -> String {
		return String(format: alteranLocalized(), arguments: arguments)
	}
	
	func alteranLocalizedPlural(_ argument: CVarArg) -> String {
		return NSString.localizedStringWithFormat(alteranLocalized() as NSString, argument) as String
	}
}
