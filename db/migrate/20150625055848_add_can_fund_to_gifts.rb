class AddCanFundToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :can_fund, :boolean, default: false
  end
end
