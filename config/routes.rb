Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
  resources :rooms, only: [:index, :create, :show, :update, :destroy]
  resources :users, only: [:index, :create, :show, :update]
  
  get '/:name', to: 'rooms#join'
  get '/', to: 'rooms#new'
end
