class SessionsController < ApplicationController
  skip_before_action :confirmed_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:password])
    return render 'new' unless user
    session[:user_id] = user.id
    @user = user
    redirect_to user_path(@user)
  end

  def destroy
   session.delete(:user_id)
   @current_user = nil
   redirect_to root_path
  end

end
