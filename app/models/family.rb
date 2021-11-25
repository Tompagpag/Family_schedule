class Family < ApplicationRecord
  include Abyme::Model

  has_many :events, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :conflicts, dependent: :destroy
  has_many :family_members, dependent: :destroy

  abymize :family_members, permit: :all_attributes

  has_many :users, through: :family_members

  def children_events(day)
    self.events.joins(:family_member)
              .where(family_members: { admin: false })
              .where('start_at::date = ?', day)
  end

  def dad_events(day)
    parents_events(day)[0]
  end

  def mum_events(day)
    parents_events(day)[1]
  end

  private

  def parents_events(day)
    self.events.joins(:family_member)
              .where(family_members: { admin: true })
              .where('start_at::date = ?', day)
              .group_by(&:family_member_id).map(&:second)
  end

end
