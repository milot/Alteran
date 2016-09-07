//
//  Alteran.swift
//  Alteran
//
//  Created by Milot Shala on 9/7/16.
//  Copyright © 2016 Milot Shala. All rights reserved.
//

import Foundation

public class Alteran: NSObject {
	
	/*
		Returns currently available languages. Languages must be added in the base bundle of the
	  application in order for this to return them accordingly.
	  - excludeBase parameter is used to exclude the Base language altogether.
  */
	public class func availableLanguages(excludeBase: Bool = false) -> [String] {
		var availableLanguages = NSBundle.mainBundle().localizations
		
		if let baseIndex = availableLanguages.indexOf("Base") where excludeBase == true {
			availableLanguages.removeAtIndex(baseIndex)
		}
		
		return availableLanguages
	}
	
	/*
		Returns the default language, remember this can be default to English if no default language is
		being returned.
	*/
	public class func defaultLanguage() -> String {
		var defaultLanguage = String()
		
		guard let preferredLanguage = NSBundle.mainBundle().preferredLocalizations.first else {
			return MILDefaultLanguage
		}
		
		let availableLanguages = self.availableLanguages()
		
		if availableLanguages.contains(preferredLanguage) {
			defaultLanguage = preferredLanguage
		} else {
			defaultLanguage = MILDefaultLanguage
		}
		
		return defaultLanguage
	}
	
	/*
		Returns current selected language, if no language is selected returns the default language.
	*/
	public class func currentLanguage() -> String {
		if let currentLanguage = NSUserDefaults.standardUserDefaults().objectForKey(MILCurrentLanguage) as? String {
			return currentLanguage
		}
		return defaultLanguage()
	}
	
	/*
		Sets the current language in Swift 3 friendly format. setCurrent(language: "en")
	*/
	public class func setCurrent(language language: String) {
		let selectedLanguage = availableLanguages().contains(language) ? language : defaultLanguage()
		if selectedLanguage != currentLanguage() {
			NSUserDefaults.standardUserDefaults().setObject(selectedLanguage, forKey: MILCurrentLanguage)
			NSUserDefaults.standardUserDefaults().synchronize()
			NSNotificationCenter.defaultCenter().postNotificationName(MILLanguageChangeNotification, object: nil)
		}
	}
	
	/*
		Resets it to default language
	*/
	public class func resetCurrentLanguageToDefault() {
		setCurrent(language: self.defaultLanguage())
	}
	
	/*
		Based on the current locale, returns the display name for the particular language.
	*/
	public class func displayNameFor(language language: String) -> String {
		let locale = NSLocale(localeIdentifier: currentLanguage())
		
		if let displayName = locale.displayNameForKey(NSLocaleLanguageCode, value: language) {
			return displayName
		}
		return String()
	}
}