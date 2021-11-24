class Event < ApplicationRecord
  belongs_to :conflict, optional: true
  belongs_to :family
  belongs_to :family_member

  after_create_commit :set_conflict
  # of after update event ?

  def set_conflict

    # children_events = family.children_events(start_at.day).where.not(id: id)
    # parent_events = family.events(start_at.day).where.not(id: id)

    if !parent_event?
      if created_childevent_iscovered_by_parentevent?
        generateconflict('transport')
      end
    end

    if parent_event? && parents_events_overlap?
      if children_events.none?
        generateconflict('babysitter')
      end
      if childevent_iscovered_by_created_parentevent?
        generateconflict('transport')
      end
    end

  end

  def offset_conflict
    # Pour régler un conflit : set un contact_id (= babysitter)
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

  def parent_event?
    family_member.admin == true
  end

  def event_date
    start_at.to_date
  end

  def created_childevent_iscovered_by_parentevent?
    dad_events.any? { |event| event.time_range.cover?(self.time_range) } &&
    mum_events.any? { |event| event.time_range.cover?(self.time_range) }
  end

  def childevent_iscovered_by_created_parentevent?
    children_events.any? { |event| self.time_range.cover?(event.time_range) }
  end

  def parents_events_overlap?
    if dad_events.include?(self)
      mum_events.any? { |event| event.time_range.overlaps?(self.time_range) }
    end
    if mum_events.include?(self)
      dad_events.any? { |event| event.time_range.overlaps?(self.time_range) }
    end
  end

  def generateconflict(conflict_type)
    new_conflict = Conflict.new(conflict_type: conflict_type, date: start_at, family: family)
    self.update(conflict: new_conflict)
    new_conflict.save
  end

end
