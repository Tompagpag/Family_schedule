class Family < ApplicationRecord
  include Abyme::Model

  has_many :events, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :conflicts, dependent: :destroy
  has_many :family_members, dependent: :destroy

  abymize :family_members, permit: :all_attributes

  has_many :users, through: :family_members

  def children_events(day)
    self.events.where(admin: false).flat_map(&:events)
              .where('extract(day from start_at) = ?', day)
  end

  def parents_events(day)
    self.events.where(admin: true).flat_map(&:events)
              .where('extract(day from start_at) = ?', day)
  end

end
