#
# Be sure to run `pod lib lint NSelect.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSelect'
  s.version          = '0.1.0'
  s.summary          = 'Select one or more option'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC

  
  let myQuestion = NSelect() // or use NSelect(options: [String]) to make it ready immadiately
  
  // setup
  myQuestion.title = "Ideal workplace for you" // for me
  myQuestion.options = [ "Calm", "Noisy", "Peaceful", "Hectic", "Fun" ] // for me
  myQuestion.defaultSelections = [ "Calm" ] // for you incase no from me
  myQuestion.mode = NSelectMode.single // | .multiple | .min(2) | .max(3)
  
  // the core part
  myQuestion.select(option: "fun")
  myQuestion.select(options: "fun", "hectic")
  myQuestion.deselect(option: "hectic")
  myQuestion.selections() //: [String] // for you
  
  // troubleshooting
  _ = myQuestion.error //: Error?
  myQuestion.isReady //: Bool
  
  // it's just a passive component
  // just give it a NSelect and it will do presentation logic to user
    let myQuestionView: NSelectView = DefaultNSelectView()
    myQuestionView.backing = myQuestion
    myQuestionView.present()
    
    // get notified about select/deselect event
    myQuestionView.delegate = ...
    
    // at any point in time
    // we can get about user selection this way
    if let userSelections = myQuestion.selections() { // or myQuestionView.backing.selections
      
    }
    
  
  DESC

  s.homepage         = 'https://github.com/fitsyu/NSelect'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fitsyu' => 'fitsyu2@gmail.com' }
  s.source           = { :git => 'https://github.com/fitsyu/NSelect.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'

  s.source_files = 'NSelect/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NSelect' => ['NSelect/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency  'UIRadioButton' 
  
  s.swift_version = '5.0'
  
end
