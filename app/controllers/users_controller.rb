class UsersController < ApplicationController
  def account
  end

  def profile
    @users = User.find_by(id: current_user)
  end

  def update

  end
end
