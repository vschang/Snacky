class RemoveLongFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :long, :float
  end
end
