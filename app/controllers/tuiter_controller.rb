class TuiterController < ApplicationController

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
      user = User.find(session[:user_id])
      user.username = params[:user][:username]
      user.email = params[:user][:email]
      user.bio = params[:user][:bio]
      user.image = params[:user][:foto]
      user.save
      redirect_to("/home")
    end
  end

  def view_posts
    if ! check_var session[:user_id]
      redirect_to("/")
    else
      @user = User.find(session[:user_id])
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
        #session[:user_id] = user.id
        redirect_to("/#{params[:user][:username]}")
      end
    else
      redirect_to("/")
    end
  end

  def view_user
    @user = User.find_by(username: params[:username])
    @posts = Post.where(id_user: @user[:id]).order(datetime: :desc)
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
