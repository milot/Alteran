# Alteran

<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS%208%2B-blue.svg?style=flat" alt="Platform: iOS 8+"/>
    <img src="https://img.shields.io/badge/platform-tvOS%209%2B-blue.svg" alt="Platform: tvOS 9+"/>    
    <img src="https://img.shields.io/badge/platform-watchOS%202.2-blue.svg" alt="Platform: watchOS 2.2"/>        
    <a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift2-compatible-4BC51D.svg?style=flat" alt="Language: Swift 2" /></a></a>
    <a href="https://github.com/milot/Pendulum/releases/tag/1.0.1"><img src="https://img.shields.io/badge/pod-v1.0.1-orange.svg" alt="CocoaPods compatible" /></a>
    <img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat" alt="License: MIT" />
     <br><br>
</p>

## Introduction

<p align="center">
<img src="http://vignette3.wikia.nocookie.net/stargate/images/1/1b/Ancient_alpahabet.png/revision/latest?cb=20070103050644" alt="Alteran Language" />
</p>

Alteran is a small localization framework that greatly improves how you deal with internationalization on Apple platforms.

Name of the framework comes from Alteran language, a name given to the language spoken by the ancients and the Ori that eventually evolved into latin.

Alteran is currently in heavy development getting ready for Swift 3.

<!--## Installation

####CocoaPods Installation
Alteran is available on [CocoaPods](http://cocoapods.org). Simply add the following to your project Podfile, and you'll be good to go.

``` ruby
use_frameworks!

pod 'Alteran'
``` -->

####Manual Installation

Simply copy the Alteran.framework on your project and you're good to go.


## Usage

Usage is quite simple:

```Swift
import Alteran

// Every string should contain .alteranLocalized() in order to be localized properly
lblCurrentLanguage.text = "Current Language:".alteranLocalized()
```

Alteran is built around class functions, therefore no instance is required, it has functions such as **availableLanguages()** that parses the containing languages from Localizable.strings file, also it includes **displayNameFor(language:)** function to grab the current display name.

You can interate through available languages and get their display names:

```Swift
for language in Alteran.availableLanguages() {
			
	let displayName = Alteran.displayNameFor(language: language)
	print(displayName)
}
```

In the example project there is an extension file that includes handy extensions for _uppercaseFirst_ and skipping items at index.