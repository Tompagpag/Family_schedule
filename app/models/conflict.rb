class Conflict < ApplicationRecord
  belongs_to :family
  belongs_to :contact, optional: true
  has_many :events
end
