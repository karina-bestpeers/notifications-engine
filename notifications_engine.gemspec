require_relative "lib/notifications_engine/version"

Gem::Specification.new do |spec|
  spec.name        = "notifications_engine"
  spec.version     = NotificationsEngine::VERSION
  spec.authors     = [""]
  spec.email       = [""]
  spec.homepage    = "https://github.com/karina-bestpeers/notifications-engine.git"
  spec.summary     = "Summary of NotificationsEngine"
  spec.description = "Description of NotificationsEngine"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://github.com/karina-bestpeers/notifications-engine.git"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/karina-bestpeers/notifications-engine.git"
  spec.metadata["changelog_uri"] = "https://github.com/karina-bestpeers/notifications-engine/blob/master/README.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.4"
end
