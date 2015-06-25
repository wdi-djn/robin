class AddPasswordToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :password, :string
  end
end
