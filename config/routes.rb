Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  root to: "spots#index"
  resources :users, only: [:show, :edit, :update]
  resources :spots do
    resources :comments, only: [:create, :destroy]
  end
end
