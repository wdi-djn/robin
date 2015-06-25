class RemoveHashedIdFromGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :hashed_id
  end
end
