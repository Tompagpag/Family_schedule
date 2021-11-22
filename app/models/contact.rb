class Contact < ApplicationRecord
  belongs_to :family
  has_many :conflicts
end
