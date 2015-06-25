class AddCurrentTotalToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :current_total, :decimal
  end
end
