class TuiterController < ApplicationController

  #Checa se o usuário está logado e salva o post recebido por POST.
  #Depois, redireciona à home
  def new_post
    if !check_var session[:user_id]
      redirect_to("/")
    else
      post = Post.new
      post.content = params[:content]
      post.datetime = Time.now
      post.location = params[:location]
      post.id_user = session[:user_id]
      post.save(validate: false)
      redirect_to("/home")
    end
  end

  #Checa se o usuário está logado e adiciona uma curtida
  def add_like
    if check_var session[:user_id]
      like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
      like.save(validate: false)
    end
  end

  #Checa se o usuário está logado e remove a curtida
  def remove_like
    if check_var session[:user_id]
      rm = Like.where("post_id = ? AND user_id = ?", params[:post_id], params[:user_id]).first
      Like.destroy(rm[:id])
    end
  end

  #Se o usuário acessa o root, mas ainda está logado, redireciona à home
  def home
    if check_var session[:user_id]
      redirect_to("/home")
    end
  end

  #Tenta efetuar o login e cria a sessão do usuário. Redireciona à home
  def login
    username=params[:user][:username]
    password=Digest::MD5.hexdigest(params[:user][:password])
    login = User.where("username = ? AND password = ?", username, password)
    if login == nil
      redirect_to("/")
    else
      session[:user_id] = login[0][:id]
      redirect_to("/home")
    end
  end

  #Efetua o logout e redireciona à raiz
  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  #Coleta as informações para gerar a página de edição de usuário
  def edit_page
    if !check_var session[:user_id]
      redirect_to("/")
    else
      @user = User.find(session[:user_id])
    end
  end

  #Salva as novas informações do Usuário logado
  def edit_user
    if !check_var session[:user_id]
      redirect_to("/")
    else
      user = User.find(session[:user_id])
      user.bio = params[:user][:bio]
      user.image = params[:user][:foto]
      user.save
      redirect_to("/home")
    end
  end

  #Captura todos os posts e mostra ao usuário logado
  def view_posts
    if !check_var session[:user_id]
      redirect_to("/")
    else
      @user = User.find(session[:user_id])
      posts = Post.order(datetime: :desc)
      @posts = []
      posts.each do |post|
        #Transforma o Objeto ActiveRecord em um Hash
        @posts << post.as_json
        user = User.find(post[:id_user])
        @posts.last[:username] = user[:username]
        @posts.last[:image] = user[:image]
        #Conta quantos likes o post tem
        likes = Like.where(post_id: post[:id]).count
        @posts.last[:likes] = likes
        #Checa se o usuário logado curtiu o post
        isliked = Like.where("post_id = ? AND user_id = ?", post[:id], session[:user_id]).count
        isliked > 0 ? @posts.last[:btn]="btn-success" : @posts.last[:btn]="btn-default"
      end
    end
  end

  #Cria um novo usuário
  def create_user
    #Checa se as variáveis do POST foram setadas com sucesso
    if check_var(params[:user]) and check_var(params[:user][:email]) and check_var(params[:user][:password]) and check_var(params[:user][:username]) and check_var(params[:user][:bio]) and check_var(params[:user][:foto])
      #Checa se o username ou email já existem
      if check_user params[:user]
        redirect_to "/"
      else
        user = User.new
        user.username = params[:user][:username]
        user.email = params[:user][:email]
        user.bio = params[:user][:bio]
        user.image = params[:user][:foto]
        user.password = Digest::MD5.hexdigest(params[:user][:password])
        user.save
        session[:user_id] = user.id
        redirect_to("/home")
      end
    else
      redirect_to("/")
    end
  end

  #Mostra somente os posts do usuário da url, checando se ele é o usuário logado
  def view_user
    @user = User.find_by(username: params[:username])
    @current_user = false
    if check_var session[:user_id] and @user[:id] == session[:user_id]
      @current_user = true
    end
    posts = Post.where(id_user: @user[:id]).order(datetime: :desc)
    @posts = []
    posts.each do |post|
      #Transforma o Objeto ActiveRecord em um Hash
      @posts << post.as_json
      #Conta quantos likes o post tem
      likes = Like.where(post_id: post[:id]).count
      @posts.last[:likes] = likes
      #Checa se o usuário logado curtiu o post
      isliked = Like.where("post_id = ? AND user_id = ?", post[:id], session[:user_id]).count
      isliked > 0 ? @posts.last[:btn]="btn-success" : @posts.last[:btn]="btn-default"
    end
  end

  private
  #Checa se uma variável existe e está definida
  def check_var(var)
    defined? var and var != nil
  end

  #Checa se o nome de usuário ou email já estão cadastrados
  def check_user(params)
    test_user = User.find_by(username: params[:username])
    flash[:user] = true unless test_user == nil
    test_email = User.find_by(email: params[:email])
    flash[:email] = true unless test_email == nil
    test_email or test_user
  end

end
