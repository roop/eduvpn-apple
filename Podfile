source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

platform :ios, '11.0'

def tunnelkit_pod
  pod 'TunnelKit'
end

project 'EduVPN', 'Debug' => :debug, 'Release' => :release

target 'EduVPN' do
  pod 'PromiseKit/CorePromise'
  pod 'AppAuth', :git => 'https://github.com/openid/AppAuth-iOS.git'
  pod 'Moya'
  pod 'AlamofireImage'
  pod 'libsodium'
  pod 'ASN1Decoder'
  pod 'NVActivityIndicatorView'

  tunnelkit_pod

  post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Target Support Files/Pods-EduVPN/Pods-EduVPN-Acknowledgements.plist', 'EduVPN/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
  end
end

target 'EduVPNTunnelExtension' do
  tunnelkit_pod
end
