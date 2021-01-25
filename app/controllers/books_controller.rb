class BooksController < ApplicationController
before_action :authenticate_user!,except: [:top]
  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  def book_params
   params.require(:book).permit(:title, :body)
  end

end