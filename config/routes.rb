Rails.application.routes.draw do
  get 'welcome/index'
  get 'about' => 'about#index', as: :about

  root 'welcome#index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  #
  namespace :shaving do
    get 'welcome/index'

    root 'welcome#index'

    resources :brands
    resources :products
    resources :reviews
  end
end
