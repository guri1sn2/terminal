class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :place_name
      t.text :near_stop

      t.timestamps
    end
  end
end
