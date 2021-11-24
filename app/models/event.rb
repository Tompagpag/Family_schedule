class Event < ApplicationRecord
  belongs_to :conflict, optional: true
  belongs_to :family
  belongs_to :family_member

  after_create_commit :set_conflict

  def set_conflict

    # attention : travailler sur les events déjà uploadés ?

    # Conflit généré si pour un jour donné :
      # papa et maman ont chacun un event qui s'overlap
        # ET un enfant a un événement qui cover les events de papa et de maman
                        # OU
        # ET les enfants n'ont pas d'event

    # Pour régler un conflit : set un contact_id (= babysitter)

    events = family.events.where.not(id: id)
                   .joins(:family_member)
                   .where(family_members: { user_id: nil })
                   .where('extract(day from start_date) = ?', start_date.day)

    events.each do |event|
      if event.time_range.overlaps?(self.time_range)
        new_conflict = Conflict.new(date: self.start_date.to_date, family: event.family)
        event.update(conflict: new_conflict)
        self.conflict = new_conflict
        new_conflict.save
        save
      end
    end
  end

  def time_range
    start_date..end_date
  end
end
