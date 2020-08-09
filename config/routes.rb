Rails.application.routes.draw do
  root to: 'other_pages#index'

  get 'users/show' => 'users#show'

  resources :matters do
    resources :comments
    resource :favorites, only: %i[create destroy]
  end

  resources :informations, only: %i[create edit update destroy]

  resources :notifications, only: :index

  resources :conversations do
    resources :messages
  end

  namespace :admin do
    resources :users, only: %i[index show edit update destroy]
    resources :matters, only: %i[index show edit update destroy]
    resources :labels
  end

  # ゲストユーザー機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
