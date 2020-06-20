class AddPostToOthercolumns < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :number, :string
    add_column :posts, :root, :string
    add_column :posts, :memo, :string
    add_column :posts, :type, :string
  end
end
