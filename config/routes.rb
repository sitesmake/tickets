Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get 'welcome' => 'welcome#index'

    resources :railway_stations do
      patch :update_position, on: :member
    end

    resources :tickets, only: [:show, :destroy, :index]

    resources :vagons, only: [:index]

    resources :trains do
      resources :vagons, shallow: true, except: [:index]

      resources :coupe_vagons, controller: 'vagons', kind: 'CoupeVagon', shallow: true
      resources :platzkart_vagons, controller: 'vagons', kind: 'PlatzkartVagon', shallow: true
      resources :sv_vagons, controller: 'vagons', kind: 'SvVagon', shallow: true
      resources :sitting_vagons, controller: 'vagons', kind: 'SittingVagon', shallow: true
    end

    resources :routes
  end

  get 'tickets' => 'tickets#index'

  resources :trains, only: [:index, :show] do
    resources :tickets, shallow: true, only: [:create, :show, :destroy]
  end



  resource :search, only: [:show] do
    post 'result'
  end

  root 'searches#show'

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
