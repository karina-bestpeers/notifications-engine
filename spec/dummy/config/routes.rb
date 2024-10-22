Rails.application.routes.draw do
  mount NotificationsEngine::Engine, at: "/notifications_engine"
end
