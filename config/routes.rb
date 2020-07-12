Rails.application.routes.draw do
  root to: 'matters#index'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' } # current_passwordを入れず、編集する
  get 'users/show' => 'users#show'

  resources :matters do
    resources :comments
    resource :favorites, only: %i[create destroy]
  end

  resources :informations, only: %i[create edit update destroy]

  resources :notifications, only: :index

  namespace :admin do
    resources :users, only: %i[index show edit update destroy]
    resources :matters, only: %i[index show edit update destroy]
    resources :labels
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
