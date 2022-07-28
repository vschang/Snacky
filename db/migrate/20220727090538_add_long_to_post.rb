class AddLongToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :long, :float
  end
end
