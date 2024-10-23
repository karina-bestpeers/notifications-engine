module NotificationsEngine
  class Engine < ::Rails::Engine
    isolate_namespace NotificationsEngine
    config.generators do |g|
      g.test_framework :rspec
    end

    config.to_prepare do
      Rails.application.config.eager_load_paths.each do |path|
        Rails.application.config.eager_load_paths << path unless Rails.application.config.eager_load_paths.include?(path)
      end
    end
  end
end
