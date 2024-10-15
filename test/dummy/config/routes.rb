Rails.application.routes.draw do
  mount NotificationsEngine::Engine => "/notifications_engine"
end
