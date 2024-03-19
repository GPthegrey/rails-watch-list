Rails.application.routes.draw do
  root to: "lists#index"

  post "/lists/:post_id/reviews", to: "reviews#create", as: "list_reviews"
  resources :lists, only: [:show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
