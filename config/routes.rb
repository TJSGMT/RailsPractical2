Rails.application.routes.draw do
  # get 'homes/index'
  root "products#index"
  # root "homes#index"
  devise_for :users
  resources :users
  resources :employees
  get '/search', to: "employees#search"
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
