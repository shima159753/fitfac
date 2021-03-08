class ChangeDatatypePriceOfPost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :price, :text
  end
end
