Rails.application.routes.draw do
  get 'welcome/index'
  get 'about' => 'about#index', as: :about

  root 'welcome#index'

  mount Shaving::Engine, at: '/shaving'

  devise_for :users, :controllers => { :registrations => "registrations" }

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
