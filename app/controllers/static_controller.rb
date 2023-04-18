class StaticController < ApplicationController
  skip_before_action :confirmed_user, only: [:home]

  def home
  end
end
