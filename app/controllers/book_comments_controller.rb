class BookCommentsController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        comment = current_user.book_comments.new(book_comment_params)
        comment.book_id = book.id
        comment.save
        redirect_to book_path(book)
    end

    def destroy
        book_comment = BookComment.find(params[:id])
        book_comment.destroy
        redirect_to book_path(params[:book_id])
        flash[:success] = 'successfully destroyed!!!'
    end

    private
    def book_comment_params
        params.require(:book_comment).permit(:comment, :book_id)
    end
end
