class BooksController < ApplicationController
  def welcome
  end

  def index
      @book = Book.new
      @books = Book.all
      @user = current_user
    end

  def show
    @user = current_user
    @a_book = Book.find(params[:id])
    @book = Book.new
  end

  def new
  	@book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  #if
    @book.save
    redirect_to book_path(@book)
  #else
  #  @books = Book.all
  #  render action: :index
  #end
  end

  def edit
  	@a_book = Book.find(params[:id])
  end

  def update
    a_book = Book.find(params[:id])
    a_book.user_id = current_user.id
    #if
    a_book.update(book_params)
    redirect_to book_path(a_book)
    #flash[:success] = 'successfully edited!!!'
    #else
    #@book = book
    #render action: :edit
    #end
  end

  def destroy
    a_book = Book.find(params[:id])
    a_book.destroy
    redirect_to books_path
    flash[:success] = 'successfully destroyed!!!'
  end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
