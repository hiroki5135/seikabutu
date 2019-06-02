class UserController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email] ,
      password: params[:password]
    )
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      session[:user_id] = @user.id
      redirect_to("/user/index")
    else
      render("user/new")
    end
  end

  def login_form
  end

  def login
     @user = User.find_by(email: params[:email])
  # if文の条件を&&とauthenticateメソッドを用いて書き換えてください
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     flash[:notice] = "ログインしました"
     redirect_to("/home/top")
   else
     @error_message = "メールアドレスまたはパスワードが間違っています"
     @email = params[:email]
     @password = params[:password]
     render("user/login_form")
   end
  end

  def logout
   session[:user_id] = nil
   flash[:notice] = "ログアウトしました"
   redirect_to("/login")
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "アカウントを削除しました"
    redirect_to("/login")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
end
