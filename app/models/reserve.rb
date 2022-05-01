class Reserve < ApplicationRecord
  belongs_to :rooms, optional: true
  belongs_to :users, optional: true

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true
  validates :room_id, presence: true
  validates :user_id, presence: true
  validate :date_validate

  private

  def date_validate
    return if start_date.blank? || end_date.blank?
    errors.add(:end_date, "は開始日よりも後の日付を選択してください") if self.end_date < self.start_date
    errors.add(:start_date, "は過去の日付は選択できません") if self.start_date < Date.current
  end
end
