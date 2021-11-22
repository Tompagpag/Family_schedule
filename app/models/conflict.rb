class Conflict < ApplicationRecord
  belongs_to :family
  belongs_to :contact
  has_many :events
end
