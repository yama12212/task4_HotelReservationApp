class RemoveNotNulltoUserIntroduce < ActiveRecord::Migration[6.1]
  def up
    change_column_null :users, :introduce, true
    change_column_null :users, :image_name, true
  end

  def down
    change_column_null :users, :introduce, false
    change_column_null :users, :image_name, false
  end
end
