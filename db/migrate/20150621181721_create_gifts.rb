class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :gift_url
      t.datetime :due_date
      t.string :recipient
      t.integer :user_id
      t.string :hashed_id

      t.timestamps null: false
    end
  end
end
