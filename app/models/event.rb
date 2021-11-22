class Event < ApplicationRecord
  belongs_to :conflict
  belongs_to :family
  belongs_to :user
end
