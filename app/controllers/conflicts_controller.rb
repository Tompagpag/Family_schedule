class ConflictsController < ApplicationController

  def index
    @family = Family.find(params[:family_id])
    @events = @family.events
    @conflicts = @family.conflicts
    @days = { 0 => "Dimanche",
              1 => "Lundi",
              2 => "Mardi",
              3 => "Mercredi",
              4 => "Jeudi",
              5 => "Vendredi",
              6 => "Samedi" }
    @months = { 1 => "janvier",
                2 => "février",
                3 => "mars",
                4 => "avril",
                5 => "mai",
                6 => "juin",
                7 => "juillet",
                8 => "août",
                9 => "septembre",
                10 => "octobre",
                11 => "novembre",
                12 => "décembre" }
  end

  def create
  end

  def update
  end
end
