Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'informations', to: 'pages#informations'
  get "enter_room", to: "pages#enter_room", as: "enter_room"
  post "post_form", to: "pages#post_form", as: "post_form"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :answers, only: [] do
    resources :user_answers, only: [:create]
  end

  resources :rooms, only: %i[index show new create] do
    resources :questions, only: [:show]
  end
end
