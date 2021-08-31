#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_baidu_yingyan_trace.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_baidu_yingyan_trace'
  s.version          = '1.0.0'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Baidu Map SDK team' => 'lbsyun.baidu@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  # s.dependency 'BaiduTraceKit', '3.1.3'
  s.dependency 'BaiduTraceKit-Lite', '3.1.3'
  s.static_framework = false

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
