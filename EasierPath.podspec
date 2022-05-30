#
# Be sure to run `pod lib lint EasierPath.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasierPath'
  s.version          = '1.0.1'
  s.summary          = 'To make it easier to use UIBezierPath ⚡️'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/UISugar/EasierPath.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fomagran' => 'fomagran6@gmail.com' }
  s.source           = { :git => 'https://github.com/UISugar/EasierPath.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'EasierPath/Classes/**/*'
  
  s.swift_versions = '5.4'
end
