Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "static#welcome"

  resources :games do
    resources :rosters, only: [:new]
  end

  resources :rosters, only: [:create, :show, :edit, :update, :destroy] do
    resources :warcraft_units, only: [:index, :new, :create]
    resources :team_fight_tactics_units, only: [:index, :new, :create]
  end

  resources :warcraft_units, only: [:create, :edit, :update, :show]
  resources :team_fight_tactics_units, only: [:create, :edit, :update, :show]

  resources :teams

  resources :users, only: [:create]

  get "signup", to: "users#new"
  get "signin", to: "sessions#new"
  get "logout", to: "sessions#destroy"
end
