class Reminder < ApplicationRecord
  belongs_to :events

  validates :reminder_date, :reminder_comment, presence: true
end
