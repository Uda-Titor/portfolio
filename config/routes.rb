Rails.application.routes.draw do
  root to: 'matters#index'
    devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }#current_passwordを入れず、編集する
  get "users/show" => "users#show"

  resources :matters
  resources :favorites, only: [:create, :destroy]

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :matters, only: [:index, :show, :edit, :update, :destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
