class UsersController < ApplicationController
  def account
  end

  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:user][:id])
    @user.update(user_params)
    redirect_to("/rooms")
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduce, :image_name)
  end
end
