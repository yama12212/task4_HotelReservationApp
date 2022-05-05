class UsersController < ApplicationController
  def account
  end

  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:user][:id])
    @image = params[:user][:image_name]

    if @user.update(user_params)

      if params[:user][:image_name]
        @image_name = "#{current_user.id}.jpeg"
        File.binwrite("public/user_images/#{@image_name}",@image.read)
      else
        @image_name = "default_user_image.jpeg"
      end
      @user.update(image_name: @image_name)

      flash[:notice] = "ユーザーの情報を更新しました"
      redirect_to("/user/#{current_user.id}")
    else
      flash[:alert] = "ユーザーの情報を更新できませんでした。"
      render("users/profile")
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduce, :image_name)
  end
end
