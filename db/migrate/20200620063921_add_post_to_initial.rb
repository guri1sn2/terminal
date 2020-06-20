class AddPostToInitial < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :initial, :text
  end
end
