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
    if user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
