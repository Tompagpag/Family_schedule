class Family < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :conflicts, dependent: :destroy
  has_many :family_members, dependent: :destroy
end
