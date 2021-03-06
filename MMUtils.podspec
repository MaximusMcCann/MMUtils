#
# Be sure to run `pod lib lint MMUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MMUtils'
  s.version          = '0.1.0'
  s.summary          = 'iOS helper files for simpler development.'
  s.description      = <<-DESC
iOS utilities for simpler development.  Mainly extension files built on top of UIKit files.
                       DESC

  s.homepage         = 'https://github.com/MaximusMcCann/MMUtils'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maximus McCann' => '' }
  s.source           = { :git => 'https://github.com/MaximusMcCann/MMUtils.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'

  s.source_files = 'MMUtils/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation'
  
  s.subspec 'Device' do |device|
    device.source_files = 'MMUtils/Classes/Device/**/*'
  end
end
