class SessionsController < ApplicationController
  skip_before_action :confirmed_user, only: [:new, :create]

  def new
    @user = User.new
  end

  # def create
  #   user = User.find_by(name: params[:user][:name])
  #   user = user.try(:authenticate, params[:password])
  #   # return head(:forbidden) unless @user.authenticate(params[:password])
  #   return render 'new' unless user
  #   session[:user_id] = user.id
  #   @user = user
  #   redirect_to user_path(@user)
  # end

  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
   session.delete(:user_id)
   @current_user = nil
   redirect_to root_path
  end

  private

  # def require_login
  #   unless current_user
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to '/'
  #   end
  # end


end
