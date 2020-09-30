class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :price, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.integer :shipping_fee, null: false
      t.integer :condition, null: false
      t.integer :shipping_from, null: false
      t.integer :preparation_day, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
