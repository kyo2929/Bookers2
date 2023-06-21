class UsersController < ApplicationController
  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @book = Book.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
