class AddPostToHiragana < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :hiragana, :string
  end
end
