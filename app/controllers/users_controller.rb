class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])#request.env['omniauth.auth']はTwitter認証で得た情報を格納するもの
    if user
      session[:user_id] = user.id
      session[:user] = user
      redirect_to cards_path, notice: "ログインしました。"
    else
      redirect_to root_path, notice: "失敗しました。"
    end
  end
  
  def logout
    reset_session
    redirect_to root_path
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:provider, :uid, :username, :image_url)
    end
end
