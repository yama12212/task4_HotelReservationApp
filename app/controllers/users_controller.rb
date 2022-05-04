class UsersController < ApplicationController
  def account
  end

  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:user][:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザーの情報を更新しました"
      redirect_to("/user/#{current_user.id}")
    else
      flash[:notice] = "ユーザーの情報を更新できませんでした。"
      render("users/profile")
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduce, :image_name)
  end
end
