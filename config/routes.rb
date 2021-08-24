Rails.application.routes.draw do
  resources :twats
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "twats#index"

end
