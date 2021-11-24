class Event < ApplicationRecord
  belongs_to :conflict, optional: true
  belongs_to :family
  belongs_to :family_member

  after_create_commit :set_conflict
  # of after update event ?

  def set_conflict
    # Travailler sur les events déjà uploadés ?

    # children_events = family.children_events(start_at.day).where.not(id: id)
    # parent_events = family.events(start_at.day).where.not(id: id)

    if !parent_event?
      if childevent_iscovered_by_mumevent? && childevent_iscovered_by_dadevent?
        return true
        # generate conflict
      end
    end

    if parent_event?

    end


    # children_events.each do |event|
    #   if event.time_range.overlaps?(self.time_range)
    #     new_conflict = Conflict.new(date: self.start_at.to_date, family: event.family)
    #     event.update(conflict: new_conflict)
    #     self.conflict = new_conflict
    #     new_conflict.save
    #     save
    #   end
    # end

  end

  def unset_conflict
    # Pour régler un conflit : set un contact_id (= babysitter)
  end

  private

  def time_range
    start_date..end_date
  end

  def parent_event?
    family_member.admin == true
  end

  def event_date
    start_at.to_date
  end

  def childevent_iscovered_by_mumevent?
    event = self.family.dad_events(event_date)
    event.time_range.covers(self.time_range)
  end

  def childevent_iscovered_by_dadevent?
    event = self.family.mum_events(event_date)
    event.time_range.covers(self.time_range)
  end

end
