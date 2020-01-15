Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end
  get 'sessions/new'
  resources :users,  only: [:new, :create, :show, :update]
  resources :sessions, only:[:new, :create, :destroy]
end
