Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :twats
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'twats#index'
  put '/twat/:id/like', to: 'twats#like', as: 'like'
  post '/twat/:id/retwat', to: 'twats#retwat', as: 'retwat'
end
