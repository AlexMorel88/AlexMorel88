Rails.application.routes.draw do

  root to: 'pages#home'
  resources :places, only:[:index, :show] do
    resources :places_reviews, only: [:new, :create, :destroy]
    resources :bookings, only: [:new, :create]
  end
  devise_for :users
  namespace :account do

    resources :places do
      resources :places_reviews, only: [:new, :create, :destroy]
    end
    resources :bookings, only: [:index, :show, :destroy]
    resources :availibilities, only: [:new, :create, :edit, :update, :destroy]
    resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get :refused
        put :refused
        get :accepted
        put :accepted
      end
    end
    resource :profile, only: [:show, :update, :edit], controller: :profile
  end
  resources :profiles, only: [:show] do
  end
  resources :users_reviews, only: [:new, :create]
end
