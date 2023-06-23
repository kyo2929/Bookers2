class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @user = current_user
    @book_new = Book.new
    @books = Book.all
  end

  def edit
    user = B.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    @book = Book.find(params[:id])
  end

  def update
    @book = User.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
