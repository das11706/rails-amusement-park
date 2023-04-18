class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :confirmed_user

  private

  def confirmed_user
    unless current_user
      redirect_to '/'
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
