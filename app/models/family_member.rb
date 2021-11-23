class FamilyMember < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :family
  has_many :events
end
