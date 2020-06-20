class ChangePostToType < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :type, :section
  end
end
