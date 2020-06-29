Pod::Spec.new do |s|
  s.name = "GLMapSwift"
  s.version = "1.2.4"
  s.summary = "GLMapSwift is a swift extensions to the GLMap framework"
  s.description = <<-DESC
This project contains Swift extensions for GLMap framework.

Please check `pod try GLMapSwift` for demo application.

DESC
  s.homepage = "https://globus.software"
  s.license = { :type => 'Apache 2.0' }
  s.author = { "Evgen Bodunov" => "evgen@globus.software" }
  s.social_media_url = "http://twitter.com/GLMapFramework"
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.documentation_url = "https://globus.software/docs/swift/api/#{s.version.to_s}/"
  s.swift_version = '5.2'
   
  s.source = {
    :git => "https://github.com/GLMap/GLMapSwift.git", 
    :tag => "#{s.version}"
  }

  s.dependency 'GLMap', "= #{s.version}"
  s.source_files = '*.swift'
end
