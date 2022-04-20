# frozen_string_literal: true

require_relative "lib/enum_temporality/version"

Gem::Specification.new do |spec|
  spec.name = "enum_temporality"
  spec.version = EnumTemporality::VERSION
  spec.authors = ["MaxenceFlatlooker"]
  spec.email = ["maxence@flatlooker.com"]

  spec.summary = "Add new methods on Rails' enums"
  spec.description = "Add new methods on Rails' enums"
  spec.homepage = "https://github.com/MaxenceFlatlooker/enum_temporality"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/MaxenceFlatlooker/enum_temporality"
  spec.metadata["changelog_uri"] = "https://github.com/MaxenceFlatlooker/enum_temporality/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # WIP: enable following for Rails 7
  #   spec.add_dependency "activerecord", ">= 6", "< 8"
  spec.add_dependency "activerecord", "~> 6"
  spec.add_development_dependency "sqlite3", "~> 1.4"
  spec.add_development_dependency "with_model", "~> 2.1"
end
