class Conflict < ApplicationRecord
  belongs_to :family
  has_many :events

  validates :conflict_type, :date, presence: true
end
