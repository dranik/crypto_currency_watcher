Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
  root to: 'pages#root'
  resources :pairs, only: %i[index show]
  get 'pairs/:id/history', to: 'pairs#history'
end
