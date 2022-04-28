class Room < ApplicationRecord
  has_many :rooms_keywords_searches
  has_many :keywords, through: :rooms_keywords_searches
  has_many :reverses
  belongs_to :user

  validates :name, presence: true
  validates :single_rate, presence: true
  validates :address, presence: true
  validates :image_name, presence: true
  validates :user_id, presence: true
end
