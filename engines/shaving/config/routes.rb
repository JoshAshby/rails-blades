Shaving::Engine.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :brands
  resources :products
  resources :reviews
end
