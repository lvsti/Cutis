Pod::Spec.new do |spec|
  spec.name = "Cutis"
  spec.version = "0.1"
  spec.summary = "Cutis (\"Comfortable UTIs\") is a thin Swift wrapper on top of the UTI (Universal Type Identifier) C API."
  spec.homepage = "https://github.com/lvsti/Cutis"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Tamas Lustyik" => 'elveestei@gmail.com' }
  spec.social_media_url = "http://twitter.com/cocoagrinder"

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'

  spec.source = { git: "https://github.com/lvsti/Cutis.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "Cutis/**/*.{h,swift}"
end
