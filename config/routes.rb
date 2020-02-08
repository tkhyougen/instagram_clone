Rails.application.routes.draw do
  root "users#new"
  resources :feeds do
    collection do
      post :confirm
      patch :update
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
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?

end
