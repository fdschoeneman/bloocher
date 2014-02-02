require 'subdomain'

Bloocher::Application.routes.draw do


  resources :certifying_bodies

  resources :carousels_images

  resources :artists

  resources :activations

  resources :accounts
  
  constraints(Subdomain) do
    get '/' => 'accounts#accountable_redirect'
  end  

  # get '/' => 'accounts#show', :constraints => { :subdomain => /.+/ }


  # resources :authentications, only: [:index, :create]
  # get '/auth/facebook/callback' => 'authentications#create' 

  # devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  devise_for :users, controllers: { confirmations: 'confirmations', 
                                    invitations: 'users/invitations',
                                    omniauth_callbacks: 'omniauth_callbacks',
                                    registrations: 'registrations'
                                  }

  devise_scope :user do 
    patch "/confirm" => "confirmations#confirm"
  end
  resources :addresses
  resources :appellations
  resources :blocks
  resources :carousels
  resources :certifications do 
    resources :vineyards
    resources :wineries 
    resources :producers 
    resources :users 
  end
  resources :fruit_lots
  resources :images
  resources :positions
  resources :producers do 
    resources :wineries
    resources :vineyards
  end
  resources :reviews
  resources :showcases 
  resources :showcases_wines, only: [:create, :destroy]
  resources :vineyards do
    resources :blocks 
    resources :vineyard_vintages
    resources :fruit_lots
    resources :certifications
  end
  resources :vineyard_vintages
  resources :wineries do 
    resources :wines
  end
  resources :wines do 
    resources :reviews
    resources :blocks
    resources :fruit_lots
  end
  resources :users do 
    resources :accounts, :wines, :wineries, :vineyards, :producers, :reviews
  end

  get '/about',         to: 'static#about'
  get '/maps',          to: 'static#maps'
  get '/contact',       to: 'static#contact'
  get '/help',          to: 'static#help'
  get '/privacy',       to: 'static#privacy'
  get '/terms',         to: 'static#terms'
  get '/triq',          to: 'static#triq'
  get '/todos',         to: 'static#index'
  get '/settings',      to: 'users#settings'
  get '/dashboard/:id', to: 'dashboard#show', as: :dashboard
  get '/profiles/:id',  to: 'profiles#show',  as: :profile
  
  root to: "static#home"
end
