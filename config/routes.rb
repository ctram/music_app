Rails.application.routes.draw do
  resources :users
  resource :session
  resources :bands do
    resources :albums, on: :member, only: [:new]
  end

  resources :albums, except: [:new] do
    resources :tracks, on: :member, only: [:new]
  end

  resources :tracks, except: [:new] do
    resources :notes, on: :member, only: [:create]
  end
end
