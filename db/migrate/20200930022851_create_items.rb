class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :price, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.integer :shipping_fee_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_from_id, null: false
      t.integer :preparation_day_id, null: false
      t.references :user, foreign_key: true
      # # 実際は下記を使用すること（テストデータ作成のためuserのバリデーションを外しています
      # t.references :user, null: false, foreign_key: true
      t.integer :buyer_id
      t.timestamps
    end
  end
end
