Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/design', to: 'pages#design'

  resources :families, only: [:new, :create] do
    resources :events, only: [:new, :create, :edit, :update, :destroy]
    resources :family_members, only: [:create]
    resources :conflicts, only: [:index, :create, :update]
    resources :contacts, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  # resources :family_members do
  #   resources :events, only: [:new, :index, :create, :edit, :update, :destroy]
  # end


  get '/calendar/callback', to: 'calendar#callback'
  get '/calendar/redirect', to: 'calendar#redirect'
  get '/calendar/import', to: 'calendar#import'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
