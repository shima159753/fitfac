class AddCustomercardTokenToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :customercard_token, :string
  end
end
