Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :artworks, only: [:index]
    member do
      get "favorites", to: "users#show_favorites"
      put "favorites/:artwork_id", to: "users#add_favorite"
      delete "favorites/:artwork_id", to: "users#delete_favorite"
    end
  end
  resources :artworks, only: [:show, :create, :update, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:index]
  # get "/users", to: "users#index", as: "users"
  # post "/users", to: "users#create"
  # get "/users/new", to: "users#new", as: "new_user"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # get "/users/:id", to: "users#show", as: "user"
  # put "/users/:id", to: "users#update"
  # patch "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
end
