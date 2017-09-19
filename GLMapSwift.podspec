Pod::Spec.new do |s|
  s.name = "GLMapSwift"
  s.version = "%VERSION%"
  s.summary = "GLMapSwift is a swift extensions to the GLMap framework"
  s.description = <<-DESC
This project contains Swift extensions for GLMap framework.

Please check `pod try GLMapSwift` for demo application.

DESC
  s.homepage = "https://getyourmap.com"
  s.license = { :type => 'Commercial', :text => "Copyright © Evgen Bodunov" }
  s.author = { "Evgen Bodunov" => "evgen@getyourmap.com" }
  s.social_media_url = "http://twitter.com/GLMapFramework"
  s.source = {
    :http => "https://getyourmap.com/account/download/GLMapSwift-#{s.version.to_s}.zip", 
    :flatten => true 
  }

  s.dependency 'GLMap', "= #{s.version}"

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.vendored_frameworks = "GLMapSwift.framework"

  s.exclude_files = "SwiftDemo"
  s.module_name = "GLMap"
end
