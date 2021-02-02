class RemoveBookIdFromBookComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_comments, :book_id, :string
  end
end
