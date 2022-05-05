class AddTotalRateToReserve < ActiveRecord::Migration[6.1]
  def up
    add_column :reserves, :total_rate, :integer
  end

  def down
    remove_column :reserves, :total_rate, :integer
  end
end
