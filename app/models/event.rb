class Event < ApplicationRecord
  belongs_to :conflict, optional: true
  belongs_to :family
  belongs_to :family_member

  validates :title, :start_at, :end_at, presence: true

  after_create_commit :set_conflict

  def conflict?
    return "true" if conflict_id.present?
  end

  def set_conflict
    # reset conflict
    self.update(conflict: nil)

    # check for conflicts
    if child_event? && conflict_events_with_all_parent?
      generate_conflict('transport', conflict_events_with_any_parent)
    end

    return unless conflict_events_with_other_parent.any?

    if children_events.none?
      generate_conflict('babysitter', conflict_events_with_other_parent)
    elsif conflict_events_with_child.any?
      generate_conflict('transport', conflict_events_with_other_parent + conflict_events_with_child)
    end
  end

  def dad_events
    family.dad_events(self.start_at)
  end

  def mum_events
    family.mum_events(self.start_at)
  end

  def children_events
    family.children_events(self.start_at)
  end

  def time_range
    start_at..end_at
  end

  private

  def child_event?
    !family_member.admin
  end

  def event_date
    start_at.to_date
  end

  def conflict_events_with_any_parent
    @conflict_events_with_any_parent ||=
      Array(dad_events).select { |event| event.time_range.cover?(self.time_range) } |
        Array(mum_events).select { |event| event.time_range.cover?(self.time_range) }
  end

  def conflict_events_with_all_parent?
    Array(dad_events).select { |event| event.time_range.cover?(self.time_range) }.any? &&
      Array(mum_events).select { |event| event.time_range.cover?(self.time_range) }.any?
  end

  def conflict_events_with_child
    @conflict_events_with_child ||= Array(children_events).select { |event| self.time_range.cover?(event.time_range) }
  end

  def conflict_events_with_other_parent
    @conflict_events_with_other_parent ||= if Array(dad_events).include?(self)
      Array(mum_events).select { |event| event.time_range.overlaps?(self.time_range) }
    elsif Array(mum_events).include?(self)
      Array(dad_events).select { |event| event.time_range.overlaps?(self.time_range) }
    else
      []
    end
  end

  def generate_conflict(conflict_type, conflict_events)
    new_conflict = Conflict.create!(conflict_type: conflict_type, date: start_at, family: family)
    self.update(conflict: new_conflict)
    conflict_events.each { |event| event.update(conflict: new_conflict) }
  end
end
