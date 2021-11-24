class Event < ApplicationRecord
  belongs_to :conflict, optional: true
  belongs_to :family
  belongs_to :family_member

  after_create_commit :set_conflict
  # of after update event ?

  def set_conflict

    # Travailler sur les events déjà uploadés ?

    # Conflit généré si pour un jour donné :
      # papa et maman ont chacun un event qui s'overlap
        # ET un enfant a un événement qui cover les events de papa et de maman
                        # OU
        # ET les enfants n'ont pas d'event

    # Pour régler un conflit : set un contact_id (= babysitter)

    # les events de la journée pour les enfants déjà créés

    children_events = family.children_events(start_date.day).where.not(id: id)
    parent_events = family.events(start_date.day).where.not(id: id)

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
