Bloocher::Application.routes.draw do
  
  devise_for :users

  resources :users do 
    resources :reviews, :wines_made, :wineries_owned, :vineyards_owned
  end
    
  resources :fruit_lots
  resources :vineyard_vintages
  resources :blocks
  resources :reviews

  resources :vineyards do
    resources :blocks 
    resources :vineyard_vintages
    resources :fruit_lots
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

  match '/about',   to: 'static#about'
  match '/contact', to: 'static#contact'
  match '/help',    to: 'static#help'
  match '/privacy', to: 'static#privacy'
  match '/terms',   to: 'static#terms'

  authenticated :user do
    root :to => 'static#home'
  end
  
  root :to => "static#home"
end