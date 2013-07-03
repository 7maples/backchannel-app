BackchannelApp::Application.routes.draw do

  root to: redirect('/goruco-2013')

  get 'auth/twitter/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  get '/users/:id', to: 'users#show'

  get '/:conference', to: 'conferences#show', as: 'conference'
  get '/:conference/:track_id', to: 'tracks#show', as: 'conference_track'
  post '/:conference/:track_id/messages', to: 'messages#create', as: 'track_messages'
  post '/:conference/:track_id/questions', to: 'questions#create', as: 'track_questions'
  post '/:conference/:track_id/questions/:question_id/vote', to: 'questions#vote', as: 'track_question_vote'
end
