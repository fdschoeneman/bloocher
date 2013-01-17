Bloocher::Application.routes.draw do
  
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
  end

  root :to => "home#index"
end