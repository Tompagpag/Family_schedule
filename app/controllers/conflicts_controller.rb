class ConflictsController < ApplicationController

  def index
    @family = Family.find(params[:family_id])
    @events = @family.events
    @conflicts = @family.conflicts
  end

  def create
  end

  def update
  end

end
