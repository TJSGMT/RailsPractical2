Rails.application.routes.draw do
  get 'homes/index'
 

  root "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :products
  # resources :orders

  resources :products do
    resources :orders 
  end

  namespace :business do
    resources :customers, only: [:index, :edit, :create, :new, :update ] do
      member do
        get :preview
        delete :delete_customer
      end
    end
  end
end
