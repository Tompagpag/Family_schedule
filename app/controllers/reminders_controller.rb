class RemindersController < ApplicationController

  def new
    @reminder = Reminder.new
    @event = Event.find(params[:event_id])
  end

  def create

  end
end
