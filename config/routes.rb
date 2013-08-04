Bloocher::Application.routes.draw do


  resources :carousels

  get "dashboard/show"
  resources :producers

  resources :images

  resources :showcases 

  resources :showcases_wines, only: [:create, :destroy]

  resources :positions

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
  end

  get 'profiles/:id', to: 'profiles#show', as: :profile

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

  get '/about',     to: 'static#about'
  get '/contact',   to: 'static#contact'
  get '/help',      to: 'static#help'
  get '/privacy',   to: 'static#privacy'
  get '/terms',     to: 'static#terms'
  get '/triq',      to: 'static#triq'
  get '/todos',     to: 'static#index'
  get '/settings',  to: 'users#settings'

  # authenticated :user do
  #   root :to => 'static#home'
  # end
  
  root :to => "static#home"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
