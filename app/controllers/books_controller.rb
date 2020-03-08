class BooksController < ApplicationController

  before_action :authenticate_user! , except:[:welcome] #「ログイン認証されていなければ、ログイン画面へリダイレクトする」という機能を実装。:authenticate_userはdeviseのメソッド

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
    @book_comment = BookComment.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    binding.pry
    if @book.save
      flash[:success] = 'New book created successfully!!!'
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user #viewだけを表示するのがrenderだから、改めて@userを定義しなければいけない。redirect_toはindexのURLを読み込むからindexで定義されていれば@userをここで改めて定義する必要はない。redirect_toとrenderの違いをちゃんと理解している必要がある。
      render action: :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
    if current_user.id != @book.user.id
       redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:success] = 'successfully edited!!!'
      redirect_to book_path(@book)
    else
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
