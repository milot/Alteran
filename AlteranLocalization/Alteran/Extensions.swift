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
		if let path = NSBundle.mainBundle().pathForResource(Alteran.currentLanguage(), ofType: "lproj"), bundle = NSBundle(path: path) {
			return bundle.localizedStringForKey(self, value: nil, table: nil)
		}
		else if let path = NSBundle.mainBundle().pathForResource(MILBase, ofType: "lproj"), bundle = NSBundle(path: path) {
			return bundle.localizedStringForKey(self, value: nil, table: nil)
		}
		return self
	}
	
	func alteranLocalizedFormat(arguments: CVarArgType...) -> String {
		return String(format: alteranLocalized(), arguments: arguments)
	}
	
	func alteranLocalizedPlural(argument: CVarArgType) -> String {
		return NSString.localizedStringWithFormat(alteranLocalized(), argument) as String
	}
}