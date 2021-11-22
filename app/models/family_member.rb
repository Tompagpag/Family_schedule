class FamilyMember < ApplicationRecord
  belongs_to :user
  belongs_to :family
  has_many :events
end
