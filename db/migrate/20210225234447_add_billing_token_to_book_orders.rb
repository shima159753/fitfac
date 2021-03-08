class AddBillingTokenToBookOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :book_orders, :billing_token, :string
  end
end
