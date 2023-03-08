Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [] do
    resources :user_answers, only: [:create]
  end

  resources :rooms, only: %i[new create show] do
    resources :questions, only: [:show]
  end
end
