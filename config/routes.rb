NotificationsEngine::Engine.routes.draw do
  resources :notifications, only: [:create, :index]
end
