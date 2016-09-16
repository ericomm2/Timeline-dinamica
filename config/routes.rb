Rails.application.routes.draw do
  #Se acessa a raiz, redireciona à página de login
  get '/', to: 'tuiter#home'
  #Se tenta salvar info na home, redireciona à criação de usuário
  post '/', to: 'tuiter#create_user'
  #Se acessa a home, redireciona à visualização de posts
  get '/home', to: 'tuiter#view_posts'
  #Se executa o login, redireciona ao controlador de login
  post '/login', to: 'tuiter#login'
  #Se executa o logout, redireciona ao controlador de logout
  get '/logout', to: 'tuiter#logout'
  #Se tenta editar o usuário, redireciona à edição de usuário
  get '/edit', to: 'tuiter#edit_page'
  #Se tenta salvar o usuário, altera com sucesso
  post '/edit', to: 'tuiter#edit_user'
  #Recebe um novo post, salva e recarrega a página
  post '/newpost', to: 'tuiter#new_post'
  #Gera uma curtida
  get '/addlike/:post_id/:user_id', to: 'tuiter#add_like'
  #Remove uma curtida
  get '/rmlike/:post_id/:user_id', to: 'tuiter#remove_like'
  #Se acessa um nome de usuário, redireciona aos posts dele
  get '/:username', to: 'tuiter#view_user'
end
