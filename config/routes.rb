Rails.application.routes.draw do
  get '/', to: 'tuiter#home'
  post '/', to: 'tuiter#create_user'
  get '/home', to: 'tuiter#view_posts'
  post '/login', to: 'tuiter#login'
  get '/logout', to: 'tuiter#logout'
  get '/edit', to: 'tuiter#edit_page'
  post '/edit', to: 'tuiter#edit_user'
  post '/password', to: 'tuiter#edit_password'
  post '/newpost', to: 'tuiter#new_post'
  get '/addlike/:post_id/:user_id', to: 'tuiter#add_like'
  get '/rmlike/:post_id/:user_id', to: 'tuiter#remove_like'
  get '/:username', to: 'tuiter#view_user'
end
