Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :games do
    resources :rosters, only: [:new]
  end

  resources :rosters, only: [:create, :show, :edit, :update, :destroy] do
    resources :warcraft_units, only: [:index, :new, :create]
    resources :team_fight_tactics_units
  end

  resources :warcraft_units, only: [:create, :edit, :update, :show]
  resources :team_fight_tactics_units, only: [:create, :edit, :update, :show]

end
