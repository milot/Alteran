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
public func AlteranLocalized(string: String) -> String {
	return string.alteranLocalized()
}

/*
AlteranLocalized function to replace NSLocalizedString that uses format arguments
- Parameter string to be localized
- Returns: Localized String
*/
public func AlteranLocalized(string: String, arguments: CVarArg...) -> String {
	return String(format: string.alteranLocalized(), arguments: arguments)
}

/*
AlteranLocalizedPlural function to replace NSLocalizedString Plural format
- Parameter string to be localized
- Returns: Localized String
*/
public func AlteranLocalizedPlural(string: String, argument: CVarArg) -> String {
	return string.alteranLocalizedPlural(argument)
}
