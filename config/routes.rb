Rails.application.routes.draw do
  get '/', to: 'tuiter#home'
  post '/', to: 'tuiter#create_user'
  get '/home', to: 'tuiter#view_posts'
  get '/:username', to: 'tuiter#view_user'
end
