class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :detail
      t.integer :price, null: false
      t.integer :category, null: false
      t.references :brand, foreign_key: true
      t.integer :shippingfee, null: false
      t.integer :condition, null: false
      t.integer :shipping_from, null: false
      t.integer :preparation_day, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
