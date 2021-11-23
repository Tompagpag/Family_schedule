Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/design', to: 'pages#design'

  resources :families, only: [:show, :new, :create] do
    resources :family_members, only: [:create]
    resources :conflicts, only: [:index, :create, :show, :update]
    resources :events, only: [:new, :create, :edit, :update, :destroy]
    resources :contacts, only: [:index, :new, :create, :destroy]
  end

  get '/calendar/callback', to: 'calendar#callback'
  get '/calendar/redirect', to: 'calendar#redirect'
  get '/calendar/import', to: 'calendar#import'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
