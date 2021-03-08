class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.string      :name,                    null: false
      t.string      :postal_code,             null: false
      t.string     :prefecture,            null: false
      t.string      :city,                    null: false
      t.string      :address,                 null: false
      t.text        :price,                   null: false
      t.string      :building_name
      t.text        :bus_hours,               null: false
      t.text        :text,                    null: false
      t.text        :item,                    null: false
      t.text        :caution,                 null: false
      t.references  :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
