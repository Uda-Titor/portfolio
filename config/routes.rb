Rails.application.routes.draw do
  root to: 'matters#index'
    devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }#current_passwordを入れず、編集する
  get "users/show" => "users#show"

  resources :matters

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
