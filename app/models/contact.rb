class Contact < ApplicationRecord
  belongs_to :family
  has_many :conflicts

  validates :first_name, :last_name, :email, :phone_number, :comment, presence: true
end
