Rails.application.routes.draw do
  root to: 'matters#index'
  resources :matters
end
