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

  get "rosters/:id/copy", to: "rosters#copy", as: "copy_roster"
  post "rosters/:id/clone", to: "rosters#clone", as: "clone_roster"

  resources :warcraft_units, only: [:create, :edit, :update, :show]
  resources :team_fight_tactics_units, only: [:create, :edit, :update, :show]

  resources :teams

  resources :users, only: [:create]

  get "signup", to: "users#new"
  get "signin", to: "static#signin"

  # DELETE not working with rails 6 and jquery, maybe this can be better
  get "logout", to: "sessions#destroy"
  resources :sessions, only: [:create]
end
