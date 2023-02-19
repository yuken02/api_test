Rails.application.routes.draw do
  # get 'homes/top'
  root to: 'homes#top'
  get "/tweets/search" => 'tweets#search'
  resources :tweets, only: [:show]
  resources :drag_and_drop, only: [:index]
  # resources :todos, only: [:index] //↓↓
  # resources :todos, only: [:index, :create] do
  #   put :sort
  # end
  resources :todos, only: [:index, :create]

  namespace :api do
    namespace :todo do
      resources :positions, only: [:update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
