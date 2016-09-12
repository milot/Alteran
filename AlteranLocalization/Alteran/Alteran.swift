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
	public class func availableLanguages(_ excludeBase: Bool = false) -> [String] {
		var availableLanguages = Bundle.main.localizations
		
		if let baseIndex = availableLanguages.index(of: "Base") , excludeBase == true {
			availableLanguages.remove(at: baseIndex)
		}
		return availableLanguages
	}
	
	/*
		Returns the default language, remember this can be default to English if no default language is
		being returned.
	*/
	public class func defaultLanguage() -> String {
		var defaultLanguage = String()
		
		guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
			return ALTDefaultLanguage
		}
		
		let availableLanguages = self.availableLanguages()
		
		if availableLanguages.contains(preferredLanguage) {
			defaultLanguage = preferredLanguage
		} else {
			defaultLanguage = ALTDefaultLanguage
		}
		
		return defaultLanguage
	}
	
	/*
		Returns current selected language, if no language is selected returns the default language.
	*/
	public class func currentLanguage() -> String {
		if let currentLanguage = UserDefaults.standard.object(forKey: ALTCurrentLanguage) as? String {
			return currentLanguage
		}
		return defaultLanguage()
	}
	
	/*
		Sets the current language in Swift 3 friendly format. setCurrent(language: "en")
	*/
	public class func setCurrent(language: String) {
		let selectedLanguage = availableLanguages().contains(language) ? language : defaultLanguage()
		if selectedLanguage != currentLanguage() {
			UserDefaults.standard.set(selectedLanguage, forKey: ALTCurrentLanguage)
			UserDefaults.standard.synchronize()
			NotificationCenter.default.post(name: Notification.Name(rawValue: ALTLanguageChangeNotification), object: nil)
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
	public class func displayNameFor(language: String) -> String {
		let locale = Locale(identifier: currentLanguage())
		
		if let displayName = (locale as NSLocale).displayName(forKey: NSLocale.Key.languageCode, value: language) {
			return displayName
		}
		return String()
	}
}
