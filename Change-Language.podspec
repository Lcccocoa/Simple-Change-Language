Pod::Spec.new do |s|
  s.name         = "Change-Language"
  s.version      = "0.1"
  s.summary      = "Force NSLocalizedString to use a specific language"
  s.description  = "Simple to use, Force NSLocalizedString to use a specific language"
  s.homepage     = "https://github.com/Lcccocoa/Simple-Change-Language"
  s.license      = "MIT"
  s.author             = { "Lcccocoa" => "Lccios@163.com" }
  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/Lcccocoa/Simple-Change-Language.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "./*.{h,m}"
  s.requires_arc = true
end
