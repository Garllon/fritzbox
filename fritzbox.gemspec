# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fritzbox/version'

Gem::Specification.new do |spec|
  spec.name          = 'fritzbox'
  spec.version       = Fritzbox::VERSION
  spec.authors       = %w[Garllon ]
  spec.email         = %w[garllon@protonmail.com]

  spec.summary       = 'Fritzbox'
  spec.description   = 'Fritzbox client to interact witht he fritxbox api'
  spec.homepage      = 'https://github.com/garllon/fritzbox/blob/main/README.md'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/garllon/fritzbox'
  spec.metadata['changelog_uri'] = 'https://github.com/garllon/fritzbox/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.20.0'
  spec.add_dependency 'nokogiri', '~> 1.15', '>= 1.15.3'
  spec.add_dependency 'zeitwerk', '~> 2.6', '>= 2.6.8'

  spec.add_development_dependency 'bundler', '~> 2.4'
  spec.add_development_dependency 'dotenv', '~> 2.8', '>= 2.8.1'
  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.54'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.22'
  spec.add_development_dependency 'simplecov', '~> 0.22.0'
  spec.add_development_dependency 'vcr', '~> 6.2'
  spec.add_development_dependency 'webmock', '~> 3.18'
end
