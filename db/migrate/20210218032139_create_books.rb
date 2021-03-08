class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.datetime     :start_time,              null: false
      t.datetime     :end_time,                null: false
      t.integer      :price,                   null: false
      t.string       :memo
      t.integer      :capacity
      t.references   :user, foreign_key: true, null: false
      t.references   :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
