class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.timestamps null: false
    end
  end
end
