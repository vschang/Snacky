class RemoveLatFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :lat, :float
  end
end
