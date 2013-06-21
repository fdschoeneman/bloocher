Bloocher::Application.routes.draw do

  resources :certifications do 
    resources :vineyards
    resources :wineries 
  end

  resources :appellations


  devise_for :users, controllers: { confirmations: 'confirmations', 
                                    registrations: 'registrations',
                                    invitations: 'users/invitations'}

  devise_scope :user do 
    put "/confirm" => "confirmations#confirm"
    resource :profile, only: [:show, :update]
  end

  resources :users do 
    resources :wines, :wineries, :vineyards, :reviews
  end
    
  resources :fruit_lots
  resources :vineyard_vintages
  resources :blocks
  resources :reviews
  
  resources :producers do 
    resources :wineries
    resources :vineyards
  end

  resources :vineyards do
    resources :blocks 
    resources :vineyard_vintages
    resources :fruit_lots
    resources :certifications
  end

  resources :wines do 
    resources :reviews
    resources :blocks
    resources :fruit_lots
  end

  resources :producers do 
    resources :wineries, :vineyards
  end

  resources :wineries do 
    resources :wines
  end

  match '/about',     to: 'static#about'
  match '/contact',   to: 'static#contact'
  match '/help',      to: 'static#help'
  match '/privacy',   to: 'static#privacy'
  match '/terms',     to: 'static#terms'
  match '/triq',      to: 'static#triq'
  match '/settings',  to: 'users#settings'

  authenticated :user do
    root :to => 'static#home'
  end
  
  root :to => "static#home"
end