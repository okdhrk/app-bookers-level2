class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
    @book.user_id = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'You have created book successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def followings
    @user =User.find(params[:id])
    @users =@user.followings.page(params[:page]).per(5)
    render 'show_followings'
  end

  def followers
    @user =User.find(params[:id])
    @users =@user.followers.page(params[:page]).per(5)
    render 'show_followers'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
