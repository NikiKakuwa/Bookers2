class BooksController < ApplicationController

  before_action :authenticate_user!

  def welcome
  end

  def index
      @user = current_user
      @book = Book.new
      @books = Book.all
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
    if
      @book.save
      redirect_to book_path(@book)
      flash[:success] = 'New book created successfully!!!'
    else
      @books = Book.all
      @user = current_user #viewだけを表示するのがrenderだから、改めて@userを定義しなければいけない。redirect_toはindexのURLを読み込むからindexで定義されていれば@userをここで改めて定義する必要はない。redirect_toとrenderの違いをちゃんと理解している必要がある。
      render action: :index
    end
  end

  def edit
  	@a_book = Book.find(params[:id])
  end

  def update
    a_book = Book.find(params[:id])
    a_book.user_id = current_user.id
    if
      a_book.update(book_params)
      redirect_to book_path(a_book)
      flash[:success] = 'successfully edited!!!'
    else
      @a_book = a_book
      render action: :edit
    end
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
