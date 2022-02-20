# frozen_string_literal: true

require_relative "lib/slack_notifiee/version"

Gem::Specification.new do |spec|
  spec.name = "slack_notifiee"
  spec.version = SlackNotifiee::VERSION
  spec.authors = ["Yamaguchi Takuya"]
  spec.email = ["yamat47.thirddown@gmail.com"]

  spec.summary = "Notifications content inspector from slack-notifier/slack-notifier."
  spec.description = "SlackNotifiee is a gem that allows you to inspect the notification content of slack-notifier/slack-notifier."
  spec.homepage = "https://github.com/yamat47/slack_notifiee"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yamat47/slack_notifiee"
  spec.metadata["changelog_uri"] = "https://github.com/yamat47/slack_notifiee/blob/main/CHANGELOG.md"

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

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "slack-notifier"

  spec.metadata['rubygems_mfa_required'] = 'true'
end
