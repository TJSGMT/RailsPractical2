Rails.application.routes.draw do
  get 'homes/index'
  root "products#index"
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
