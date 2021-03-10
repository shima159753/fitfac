Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'cards', to: 'users/registrations#new_card'
    post 'cards', to: 'users/registrations#create_card'
    #patch 'cards', to: 'users/registrations#update_card'
    #get 'cards_edit', to: 'users/registrations#edit_card'
  end
  root to: "posts#index"
  resources :posts do
    resources :books, only: [:new, :create,:destroy,:show] do
        collection do
          get "sort"
          get "sort_result"
        end
      post "order" , on: :member
      delete "order_destroy" , on: :member
    end
    collection do
      get "search"
      get "sort"
    end
    
  end      
  resources :users, only: [:show] do
    resources :cards, only: [:new, :create, :edit, :update]
  end
  #get "/map_request", to: "posts#map", as: "map_request"
  post "goods/:post_id/create", to: "goods#create" 
  post "goods/:post_id/destroy", to: "goods#destroy"
  get "users/:id/goods", to: "users#goods"
  post "contacts/create", to: "contacts#create"
  get "contacts/new", to: "contacts#new"

end
