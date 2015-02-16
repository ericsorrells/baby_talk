class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin

      t.timestamps null: false
    end
    add_index "users", ["email"], name: "index_users_on_email", unique: true
    add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  end
end
