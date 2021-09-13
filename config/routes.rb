Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :twats do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'twats#index'
  put '/twat/:id/like', to: 'twats#like', as: 'like'
  post '/twat/:id/retwat', to: 'twats#retwat', as: 'retwat'
  post '/twat/:id/comment', to: 'twats#comment', as: 'comment_on_twat'

end
