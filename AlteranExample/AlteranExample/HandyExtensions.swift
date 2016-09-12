//
//  HandyExtensions.swift
//  Alteran
//
//  Created by Milot Shala on 9/12/16.
//  Copyright © 2016 Milot Shala. All rights reserved.
//

import Foundation


/* 
		Some languages such as Albanian contain all lower-case strings for languages.
		This extension helps for uppercasing first letter.
*/
extension String {
	var first: String {
		return String(characters.prefix(1))
	}
	var last: String {
		return String(characters.suffix(1))
	}
	var uppercaseFirst: String {
		return "\(first.uppercased())\(String(characters.dropFirst()))"
	}
}

// In case you need to skip a couple of languages.
extension Array {
	func skip(count:Int)->[Element] {return [Element](self[count..<self.count])}
}
