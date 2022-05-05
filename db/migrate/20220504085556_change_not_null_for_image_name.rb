class ChangeNotNullForImageName < ActiveRecord::Migration[6.1]
  def up
    change_column_null :users, :image_name, false
  end

  def down
    change_column_null :users, :image_name, true
  end
end
