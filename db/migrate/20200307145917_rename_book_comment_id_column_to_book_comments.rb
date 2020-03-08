class RenameBookCommentIdColumnToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :book_comments, :book_comment_id, :book_id
  end
end
