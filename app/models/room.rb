class Room < ApplicationRecord
  has_many :rooms_keywords_searches
  has_many :keywords, through: :rooms_keywords_searches

  has_many :reverses

  belongs_to :user
end
