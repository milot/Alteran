//
//  Functions.swift
//  Alteran
//
//  Created by Milot Shala on 9/7/16.
//  Copyright © 2016 Milot Shala. All rights reserved.
//

import Foundation

/* 
		Syntax to support Swift 1.x
*/


/* 
AlteranLocalized function to replace NSLocalizedString
- Parameter string to be localized
- Returns: Localized String
*/
public func AlteranLocalized(string string: String) -> String {
	return string.localized()
}

/*
AlteranLocalized function to replace NSLocalizedString that uses format arguments
- Parameter string to be localized
- Returns: Localized String
*/
public func AlteranLocalized(string string: String, arguments: CVarArgType...) -> String {
	return String(format: string.localized(), arguments: arguments)
}

/*
AlteranLocalizedPlural function to replace NSLocalizedString Plural format
- Parameter string to be localized
- Returns: Localized String
*/
public func AlteranLocalizedPlural(string string: String, argument: CVarArgType) -> String {
	return string.localizedPlural(argument)
}