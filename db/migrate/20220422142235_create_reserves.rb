class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :number_of_people, null: false
      t.integer :room_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
