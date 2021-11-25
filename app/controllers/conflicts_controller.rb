class ConflictsController < ApplicationController

  def index
    @conflicts = Conflict.all
    @events = Event.all
  end

  def show
    @conflict = Conflict.find(params[:id])
    # @events = Event.where("start_at LIKE ?", @conflict.events.first.start_at.strftime("%y-%m-%d"))
    @events = Event.where("date(start_at) = ?", @conflict.date)
  end

  def create
  end

  def update
  end
end
