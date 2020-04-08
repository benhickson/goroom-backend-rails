Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'rooms#new'
  get '/:name', to: 'rooms#show'

  get '/user/:id', to: 'users#show'
end
