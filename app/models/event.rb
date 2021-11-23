class Event < ApplicationRecord
  belongs_to :conflict, optional: true
  belongs_to :family
  belongs_to :family_member

  # after_create_commit :set_conflict

  # def set_conflict
  #   events = family.events.where.not(id: id).where('start_date = ?', start_date)

  #   events.each do |event|
  #     if event.time_range.cover?(self.time_range)
  #       Conflict.create()
  #     end
  #   end
  # end

  def time_range
    start_date..end_date
  end
end
