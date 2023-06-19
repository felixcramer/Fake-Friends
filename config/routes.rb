Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "join_room", to: "pages#join_room", as: "join_room"
  post "post_join_room", to: "pages#post_join_room", as: "post_join_room"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :rooms, only: %i[index show new create] do
    resources :room_questions, only: %i[show new create update]
    get "new_round", to: "rooms#new_round", as: "new_round"
    post "create_round", to: "rooms#create_round", as: "create_round"
    get "ranking", to: "rooms#ranking", as: "ranking_room"
  end
end
