Rails.application.routes.draw do
  
  devise_for  :users, 
              path: '/',
              path_names: { 
                            sign_in: 'signin', 
                            sign_up: 'signup',
                            sign_out: 'signout'
                          },
              controllers:{ 
                            sessions: 'users/sessions',
                            registrations: 'users/registrations',
                            passwords: 'users/passwords'
                          }


  devise_scope :user do
    post 'signin', to: 'users/sessions#create', as: 'signin_create'
    delete 'signout', to: 'user/sessions#destroy', as: 'signout'
    post 'signup', to: 'users/registrations#create',  as: 'signup_create'
  end

  root to: '/', to: 'home#dashboard'
  get 'dashboard', to: 'home#dashboard'
  
  resources :categories
  resources :journals

  resources :todo_lists do
    resources :todo_items do
      member do
       patch :complete
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
