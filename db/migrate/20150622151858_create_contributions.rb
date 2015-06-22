class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :user_id
      t.integer :gift_id
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
