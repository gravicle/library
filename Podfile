use_frameworks!
inhibit_all_warnings!

target 'Library' do

  pod 'RxSwift', '~> 3.4'
  pod 'RxCocoa', '~> 3.4'

  target 'LibraryTests' do
    inherit! :search_paths
    pod 'Nimble', '~> 7.0'
    pod 'RxTest', '~> 3.4'
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    setSwiftVersion(3.2, target)
    enableWholeModuleCompilation(target)
  end
end


def enableWholeModuleCompilation(target)
  target.build_configurations.each do |config|
    # -wmo for release, wmo-like building but no optimization for other configs
    if config.name == 'Release'
      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
    else
      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
    end
    
    config.build_settings['SWIFT_WHOLE_MODULE_OPTIMIZATION'] = 'YES'  
  end
end

def setSwiftVersion(version, target)
  target.build_configurations.each do |config|
    config.build_settings['SWIFT_VERSION'] = "#{version}"
  end
end