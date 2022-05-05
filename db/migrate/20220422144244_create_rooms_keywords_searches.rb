class CreateRoomsKeywordsSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms_keywords_searches do |t|
      t.integer :room_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
