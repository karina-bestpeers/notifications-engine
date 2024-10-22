module NotificationsEngine
  class Engine < ::Rails::Engine
    isolate_namespace NotificationsEngine
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
