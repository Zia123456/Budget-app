Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :splashs, only: [:index]

  resources :groups do 
    resources :transactions
  end
 

  root 'splashs#index'
end
