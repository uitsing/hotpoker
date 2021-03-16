Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms do
    resources :items do
      member do
        get :reveal
        post :restart
      end
      resources :cards
    end
  end
  resources :users
end
