AmechanBox::Application.routes.draw do
  resources :comments

  devise_for :staffs
  resources :needs do
    resources :answers
    get 'waiting'    , to: :waitings    , on: :collection, as: 'waiting'
    get 'on_handling', to: :on_handlings, on: :collection, as: 'on_handling'
    get 'on_hold'    , to: :on_holds    , on: :collection, as: 'on_hold'
    get 'resolved'   , to: :resolveds   , on: :collection, as: 'resolved'
    get 'rejection'  , to: :rejections  , on: :collection, as: 'rejection'
  end

  resources :staffs

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'needs#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
