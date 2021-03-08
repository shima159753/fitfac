class CreateBookOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :book_orders do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
