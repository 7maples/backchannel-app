BackchannelApp::Application.routes.draw do

  root to: 'users#index'
  get 'auth/twitter/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  resources :questions, only: :index

end
