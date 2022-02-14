Rails.application.routes.draw do
  
  get 'home/index'
  get 'home/dashboard'
  resources :categories
  resources :journals

  resources :todo_lists do
    resources :todo_items do
      member do
       patch :complete
      end
    end
  end

  # get "/", to: "home#index" 

  root "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
