class Keyword < ApplicationRecord
  has_many :rooms_keywords_searches
  has_many :rooms, through: :rooms_keywords_searches
end
