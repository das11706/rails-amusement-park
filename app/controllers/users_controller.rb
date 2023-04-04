class UsersController < ApplicationController
  
  def new
  end





    private

    def user_params
      params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
    end

end
