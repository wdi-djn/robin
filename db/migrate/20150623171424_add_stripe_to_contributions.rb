class AddStripeToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :stripeToken, :string
    add_column :contributions, :stripeTokenType, :string
    add_column :contributions, :stripeEmail, :string
  end
end
