#
# Be sure to run `pod lib lint LQCCharts.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LQCCharts'
  s.version          = '0.1.1'
  s.summary          = 'Custom some styles base on Charts'
  s.swift_version    = '4.1'
 
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'Custom some styles base on Charts, do not change any code in ChartsSourceCode'

                       DESC
                       
  s.homepage         = 'https://github.com/liangqicai-gitHub/LQCCharts'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '梁齐才' => '2468751795@qq.com' }
  s.source           = { :git => 'https://github.com/liangqicai-gitHub/LQCCharts.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'LQCCharts/Classes/**/*'
  s.frameworks = 'UIKit'
  #s.dependency 'YYKit', '= 1.0.9'
end
