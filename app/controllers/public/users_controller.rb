class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
      @user = User.find(params[:id])
      @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
      params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
