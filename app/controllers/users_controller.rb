class UsersController < ApplicationController
  def show
  	@a_user = User.find(params[:id])
  	@book = Book.new
  	@mybooks = @a_user.books.page(params[:page]).reverse_order
  end

  def edit
    @a_user = User.find(params[:id])
  end

  def update
    @a_user = User.find(params[:id])
    @a_user.update(user_params)
    @user = User.find(current_user.id)
    redirect_to user_path(@user)
  end
  private
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end
end
