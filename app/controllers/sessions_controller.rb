class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate login_params['email'], login_params['password'], login_params['name']

    if @user
      session[:user_id] = @user.id
      flash[:success] = "User logged in!!"
      redirect_to root_path
    else
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
