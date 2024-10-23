NotificationsEngine::Engine.routes.draw do
  resources :notifications, only: [:create, :index]
  get 'notifications/in_app', to: 'notifications#show_in_app_notifications', as: 'in_app_notifications'
  get 'notifications/read_all', to: 'notifications#read_all', as: 'read_all_notifications'
  get 'notifications/read_one', to: 'notifications#read_one', as: 'read_one_notifications'
end
