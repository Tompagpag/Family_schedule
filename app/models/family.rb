class Family < ApplicationRecord
  include Abyme::Model

  has_many :events, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :conflicts, dependent: :destroy
  has_many :family_members, dependent: :destroy

  abymize :family_members, permit: :all_attributes

  has_many :users, through: :family_members

  def children_events
    family_members.where(admin: false).flat_map(&:events)
  end

  def parents_events
    family_members.where(admin: true).flat_map(&:events)
  end
end
