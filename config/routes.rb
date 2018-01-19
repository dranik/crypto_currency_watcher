Rails.application.routes.draw do
  root to: 'pages#root'
  resources :pairs, only: %i[index show]
  get 'pairs/:id/history', to: 'pairs#history'
end
