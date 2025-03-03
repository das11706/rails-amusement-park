class UsersController < ApplicationController
  skip_before_action :confirmed_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

    private

    def user_params
      params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
    end

end
