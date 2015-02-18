class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string :name
      t.string :sex
      t.integer :month
      t.integer :day
      t.integer :year
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
