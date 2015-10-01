class SessionController < ApplicationController
   after_action :current_user, only: [:create]
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      session[:user_name] = @user.profile.name
      redirect_to departments_path, :notice => "Welcome "+session[:user_name]
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id],session[:user_name],session[:cart_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end