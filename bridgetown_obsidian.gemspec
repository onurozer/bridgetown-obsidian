# frozen_string_literal: true

require_relative "lib/bridgetown_obsidian/version"

Gem::Specification.new do |spec|
  spec.name = "bridgetown_obsidian"
  spec.version = BridgetownObsidian::VERSION
  spec.author = "Onur Ozer"
  spec.email = "onur@simplematters.dev"
  spec.summary = "Converts Obsidian notes to Bridgetown posts"
  spec.homepage = "https://github.com/onurozer/bridgetown-obsidian"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|script|spec|features|frontend)/}) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7.0"

  spec.add_dependency "bridgetown", ">= 1.2.0", "< 2.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", ">= 13.0"
  spec.add_development_dependency "standard"
end
