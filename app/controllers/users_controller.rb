class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
    @book = Book.new

  end
  def show
  	@a_user = User.find(params[:id])
  	@book = Book.new
  end

  def edit
    @a_user = User.find(params[:id])
    if current_user != @a_user
       redirect_to user_path(current_user)
     end
  end

  def update
    @a_user = User.find(params[:id])
    if @a_user.update(user_params)
      flash[:success] = 'User info edited successfully!!!'
      redirect_to user_path(@a_user)
    else
      render action: :edit
    end

  end
  private
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end
end
