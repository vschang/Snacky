class AddProfPicToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :prof_pic, :string
  end
end
