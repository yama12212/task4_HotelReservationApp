class ChangeNotNullForTotalRate < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reserves, :total_rate, false
  end
end
