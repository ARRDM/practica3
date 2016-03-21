# coding: utf-8
Rails.application.routes.draw do

  #Ruta principal
  root 'main#index'

  get 'sessions/new'

  #Rutas directas o estáticas
  get 'sessions/new'
  get 'login' => 'sessions#new'
  get 'registro' => 'm_users#new'

  get 'verpost' => 'posts#index'
  resources :posts

  resources :m_users
  get 'posts/:posts_id/donador' => 'posts#responder_solicitud', :as => :donador
  get 'posts/:posts_id/rechazar' => 'posts#rechazar_solicitud', :as => :rechazar
  get 'posts/:posts_id/aceptar' => 'posts#aceptar_solicitud', :as => :aceptar
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'



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
