Rails.application.routes.draw do
  get '/', to: 'tuiter#home'
  post '/', to: 'tuiter#create_user'
  get '/home', to: 'tuiter#view_posts'
  post '/login', to: 'tuiter#login'
  get '/logout', to: 'tuiter#logout'
  get '/edit', to: 'tuiter#edit_page'
  post '/edit', to: 'tuiter#edit_user'
  post '/password', to: 'tuiter#edit_password'
  get '/:username', to: 'tuiter#view_user'
end
