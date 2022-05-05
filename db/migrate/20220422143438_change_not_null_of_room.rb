class ChangeNotNullOfRoom < ActiveRecord::Migration[6.1]
  def up
    change_column :rooms, :name, :string, null: false
    change_column :rooms, :single_rate, :integer, null: false
    change_column :rooms, :address, :string, null: false
    change_column :rooms, :image_name, :string, null: false
    change_column :rooms, :user_id, :integer, null: false
  end

  def down
    change_column :rooms, :name, :string
    change_column :rooms, :single_rate, :integer
    change_column :rooms, :address, :string
    change_column :rooms, :image_name, :string
    change_column :rooms, :user_id, :integer
  end
end
