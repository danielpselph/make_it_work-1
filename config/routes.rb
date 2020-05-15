Rails.application.routes.draw do
  #projects
  get '/projects/:project_id', to: 'projects#show'
  post '/projects/:project_id/add_contestant', to: 'projects#add_contestant'

  #contestants
  get '/contestants', to: 'contestants#index'


end
