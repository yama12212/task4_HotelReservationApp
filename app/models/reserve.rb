class Reserve < ApplicationRecord
  belongs_to :rooms
  belongs_to :users

  validates :start_date, presence: true
  validates :end_date, presence: true
  valiadtes :number_of_people, presence: true
  validates :room_id, presence: true
  validates :user_id, presence: true
end
