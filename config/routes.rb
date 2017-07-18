Rails.application.routes.draw do
  devise_for :users
  resources :universities do
    resources :reviews
  end

  root to: 'universities#index'

  post 'auth_user' => 'authentication#authenticate_user'
  get 'home' => 'universities#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
