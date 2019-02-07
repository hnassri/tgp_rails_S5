Rails.application.routes.draw do
  resources :gossip do
    resources :user
    resources :comment
  end
  resources :gossip
  resources :city
  resources :user
  resources :comment
  resources :sessions
  # get 'gossip/:id', to: 'gossip#gossip_page'
  # get 'gossip/:id/:user_id', to: 'gossip#gossip_author'
  get 'home/:user_by_name', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home', to: 'home#index'
  get '/team', to: 'team#members'
  get '/contact', to: 'contact#address'
end
