# Alteran podspec
Pod::Spec.new do |s|

  s.platforms = { :ios => "8.0", :osx => "10.7", :watchos => "2.0", :tvos => "9.0" }
  s.name = "Alteran"
  s.summary = "Alteran is a small localization framework that greatly improves how you deal with internationalization on Apple platforms."
  s.requires_arc = true

  s.version = "1.0"

  s.homepage     = "http://milot.io/"
  s.license = { :type => "MIT", :file => "LICENSE.md" }

  s.author             = { "Milot Shala" => "milot.shala@gmail.com" }
  s.social_media_url   = "http://twitter.com/milot"

  s.source       = { :git => "https://github.com/milot/Alteran.git", :tag => "#{s.version}" }

  s.source_files = "../Alteran/*.{h,swift}"

end
