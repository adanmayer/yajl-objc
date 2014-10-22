Pod::Spec.new do |s|
  s.name         = "yajl-objc-arc"
  s.version      = "0.1.0"
  s.summary      = "Objective-C bindings for YAJL (Yet Another JSON Library) C library with ARC"
  s.homepage     = "http://lloyd.github.com/yajl"
  s.license      = 'MIT'
  s.author       = "Gabriel Handford", "Alexander Danmayer"
  s.source       = { :git => "https://github.com/adanmayer/yajl-objc-arc.git", :branch => "master" }
  s.source_files = 'Classes/*.{h,m}', 'Libraries/{GHKit,GTM}/*.{h,m}'
  s.dependency     'yajl', '~>1.0.11'
end
