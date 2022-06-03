require_relative 'lib/thumbor_helpers/version'

Gem::Specification.new do |spec|
  spec.name = "thumbor_helpers"
  spec.version = ThumborHelpers::VERSION
  spec.authors = ["Marino Bonetti"]
  spec.email = ["marinobonetti@gmail.com"]

  spec.summary = %q{collection of helpers to simplify live for use thumbor with rails and alchemy}
  spec.description = %q{collection of helpers to simplify live for use thumbor with rails and alchemy}
  spec.homepage = "https://github.com/ArchimediaZerogroup/ThumborHelpers"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ArchimediaZerogroup/ThumborHelpers"
  spec.metadata["changelog_uri"] = "https://github.com/ArchimediaZerogroup/ThumborHelpers/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-thumbor", ">= 4"

end
