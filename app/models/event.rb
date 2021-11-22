class Event < ApplicationRecord
  belongs_to :conflict
  belongs_to :family
  belongs_to :family_member
end
