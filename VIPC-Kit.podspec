Pod::Spec.new do |s|

  s.name         = "VIPC-Kit"
  s.version      = "0.0.1"
  s.summary      = "A protocol oriented Coordinator powered VIP (Clean Swift) variation"
  # s.homepage     = ""
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Zonily Jame Pesquera" => "zonilyjame@gmail.com" }
  s.social_media_url   = "https://www.linkedin.com/in/zjgpesquera/"

  s.platform     = :ios, "8.0"
  # s.requires_arc = true
  s.source       = { :git => "https://github.com/kuyazee/VIP-C-Kit.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Sources/**/*.{h,swift}"

  s.description  = "A Protocol oriented Coordinator pattern"
  s.homepage     = "https://github.com/kuyazee/VIP-C-Kit"
  s.exclude_files = "Classes/Sample Project"
  # s.public_header_files = "Classes/**/*.h"

end