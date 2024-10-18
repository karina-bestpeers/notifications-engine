NotificationsEngine::Engine.routes.draw do
  resources :notifications, only: [:create, :index]
  get 'notifications/in_app', to: 'notifications#show_in_app_notifications', as: 'in_app_notifications'

end
