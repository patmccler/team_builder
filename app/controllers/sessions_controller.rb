class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: user_params[:username])

    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else

      render "static/signin"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
