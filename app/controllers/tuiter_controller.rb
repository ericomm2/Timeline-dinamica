class TuiterController < ApplicationController

  def new_post
    if ! check_var session[:user_id]
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

  def add_like
    if check_var session[:user_id]
      like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
      like.save(validate: false)
    end
  end

  def remove_like
    if check_var session[:user_id]
      rm = Like.where("post_id = ? AND user_id = ?", params[:post_id],params[:user_id]).first
      Like.destroy(rm[:id])
    end
  end

  def home
    if check_var session[:user_id]
      redirect_to("/home")
    end
  end

  def login
    username=params[:user][:username]
    password=Digest::MD5.hexdigest(params[:user][:password])
    login = User.where("username = ? AND password = ?",username,password)
    if login == nil
      redirect_to("/")
    else
      session[:user_id] = login[0][:id]
      redirect_to("/home")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def edit_page
    if ! check_var session[:user_id]
      redirect_to("/")
    else
      @user = User.find(session[:user_id])
    end
  end

  def edit_user
    if ! check_var session[:user_id]
      redirect_to("/")
    else
      if check_user params[:user]
        redirect_to "/home"
      else
        user = User.find(session[:user_id])
        user.bio = params[:user][:bio]
        user.image = params[:user][:foto]
        user.save
        redirect_to("/home")
      end
    end
  end

  def view_posts
    if ! check_var session[:user_id]
      redirect_to("/")
    else
      @user = User.find(session[:user_id])
      posts = Post.order(datetime: :desc)
      @posts = []
      posts.each do |post|
        @posts << post.as_json
        user = User.find(post[:id_user])
        @posts.last[:username] = user[:username]
        @posts.last[:image] = user[:image]
        likes = Like.where(post_id: post[:id]).count
        @posts.last[:likes] = likes
        isliked = Like.where("post_id = ? AND user_id = ?", post[:id],post[:id_user]).count
        isliked > 0 ? @posts.last[:btn]="btn-success" : @posts.last[:btn]="btn-default"
      end
    end
  end

  def create_user
    if check_var(params[:user]) and check_var(params[:user][:email]) and check_var(params[:user][:password]) and check_var(params[:user][:username]) and check_var(params[:user][:bio]) and check_var(params[:user][:foto])
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

  def view_user
    @user = User.find_by(username: params[:username])
    @posts = Post.where(id_user: @user[:id]).order(datetime: :desc)
    @current_user = false
    if check_var session[:user_id] and @user[:id] == session[:user_id]
      @current_user = true
    end
  end

  private
  def check_var(var)
    defined? var and var != nil
  end

  def check_user(params)
    test_user = User.find_by(username: params[:username])
    flash[:user] = true unless test_user == nil
    test_email = User.find_by(email: params[:email])
    flash[:email] = true unless test_email == nil
    test_email or test_user
  end

end
