//
//  ViewController.swift
//  AlteranExample
//
//  Created by Milot Shala on 9/12/16.
//  Copyright © 2016 Milot Shala. All rights reserved.
//

import UIKit
import Alteran

class ViewController: UIViewController {
	@IBOutlet weak var lblCurrentLanguage: UILabel!
	@IBOutlet weak var lblActualLanguageWording: UILabel!
	@IBOutlet weak var btnSwitchLanguage: UIButton!
	var actionSheet: UIAlertController!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		changeViewText()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		NotificationCenter.default.addObserver(self, selector: #selector(changeViewText), name: NSNotification.Name(rawValue: ALTLanguageChangeNotification), object: nil)
	}
	
	func changeViewText() {
		lblCurrentLanguage.text = "Current Language:".alteranLocalized()
		lblActualLanguageWording.text = Alteran.displayNameFor(language: Alteran.currentLanguage()).uppercaseFirst
		btnSwitchLanguage.setTitle("Switch".alteranLocalized(), for: .normal)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func switchLanguagePressed(_ sender: AnyObject) {
		self.actionSheet = UIAlertController(title: nil, message: "Switch".alteranLocalized(), preferredStyle: .actionSheet)
		for language in Alteran.availableLanguages() {
			
			let displayName = Alteran.displayNameFor(language: language).uppercaseFirst
			let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
				(alert: UIAlertAction!) -> Void in
				Alteran.setCurrent(language: language)
			})
			self.actionSheet.addAction(languageAction)
		}
		let cancelAction = UIAlertAction(title: "Cancel".alteranLocalized(), style: .cancel, handler: {
			(alert: UIAlertAction) -> Void in
		})
		self.actionSheet.addAction(cancelAction)
		self.present(self.actionSheet, animated: true, completion: nil)
	}

}

