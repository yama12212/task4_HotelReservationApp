class AddUserEtcToUser < ActiveRecord::Migration[6.1]
  def up
   add_column :users, :name, :string, null: false
   add_column :users, :introduce, :text, null: false
   add_column :users, :image_name, :string, null: false
  end

  def down
   remove_column :users, :name, :string
   remove_column :users, :introduce, :text
   remove_column :users, :image_name, :string
  end
end
