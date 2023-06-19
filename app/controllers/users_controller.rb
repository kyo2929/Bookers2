class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end
  
end
