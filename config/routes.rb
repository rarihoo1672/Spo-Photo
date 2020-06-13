Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get 'users',      to: 'users/registrations#new'
    post 'sign_up',     to: 'users/registrations#create'
    post 'login', to: 'devise/sessions#create'
    get "sign_out", :to => "users/sessions#destroy" 
  end

  root to: "spots#index"
  resources :users, only: [:show, :edit, :update]
  resources :spots do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
