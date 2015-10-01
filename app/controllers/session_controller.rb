class SessionController < ApplicationController
   after_action :current_user, only: [:create]
  def new
  end

  def create
    @user  = User.authenticate(params[:email], params[:password])
    @admin = Admin.authenticate(params[:email], params[:password])unless @user

    if @user
      session[:user_id]   = @user.id
      session[:user_name] = @user.profile.name
      redirect_to store_index_path, :notice => "Welcome "+session[:user_name]
    elsif @admin
      session[:admin]    = true
      session[:admin_id] = @admin.email
      redirect_to admins_path, :notice => "Welcome Admin"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id],session[:user_name],session[:cart_id],session[:admin_id],session[:admin] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
