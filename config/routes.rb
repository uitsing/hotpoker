Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms do
    resources :items do
      resources :cards
    end
  end
  resources :users
end
