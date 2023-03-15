Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'informations', to: 'pages#informations'
  get "your_games", to: "pages#your_games", as: "your_games"
  get "enter_room", to: "pages#enter_room", as: "enter_room"
  post "post_form", to: "pages#post_form", as: "post_form"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :user_answers, only: [:create]

  resources :rooms, only: %i[index show new create] do
    resources :room_questions, only: %i[index show new create update]
    get "creating_round", to: "pages#creating_round", as: "creating_round"
    post "post_round", to: "pages#post_round", as: "post_round"
    get "ranking", to: "pages#ranking", as: "ranking_room"
  end
end
