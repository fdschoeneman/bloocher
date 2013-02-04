Bloocher::Application.routes.draw do
  
  resources :vineyards do
    resources :blocks 
  end

  resources :blocks

  resources :producers

  resources :wineries

  authenticated :user do
    root :to => 'home#index'
  end
  
  devise_for :users

  resources :users do 
    resources :reviews 
  end

  resources :reviews
  
  resources :wines do 
    resources :reviews
    resources :blocks
  end

  root :to => "home#index"
end