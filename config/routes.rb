Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end
  get 'sessions/new'
  resources :users do
    collection do
      get :favorite_index
    end
  end
  resources :sessions, only:[:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
