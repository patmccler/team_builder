Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :games do
    resources :rosters, only: [:new, :create]
  end

  resources :rosters, only: [:show, :edit, :update, :delete]

end
