class AddColumnsToSchemas < ActiveRecord::Migration
  def change
    add_column :gifts, :active, :boolean, default: true
    add_column :contributions, :paid, :boolean, default: false
  end
end
