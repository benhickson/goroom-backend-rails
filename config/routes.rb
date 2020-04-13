Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'rooms/show_name/:name', to: 'rooms#show_name'
  resources :rooms, only: [:index, :create, :show, :update, :destroy]

  get 'users/anon', to: 'users#anon'
  get 'users/current', to: 'users#current'
  post 'users/login', to: 'users#login'
  resources :users, only: [:index, :create, :show, :update]

  # get '/:name', to: 'rooms#join'
  # get '/', to: 'rooms#new'
end
