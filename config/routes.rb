Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  # get 'users' => 'users#index'
  # get 'users/:id' => 'users#show'
  # post 'users/' => 'users#create'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # get 'users/new' => 'users#new'
  # get 'users/:id/edit' => 'users#edit'
  # delete 'users/:id' => 'users#destroy'
end
