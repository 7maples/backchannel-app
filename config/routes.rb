BackchannelApp::Application.routes.draw do

  root to: 'users#index'
  get 'auth/twitter/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  get '/:conference', to: 'conferences#show'

  # resources :questions, only: :index
  # resources :schedules, only: :index
end
