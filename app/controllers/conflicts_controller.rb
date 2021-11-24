class ConflictsController < ApplicationController

  def index
    @conflicts = Conflict.all
    @events = Event.all
  end

  def show
  end

  def create
  end

  def update
  end
end
