class EventsController < ApplicationController
  extend SimpleCalendar

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    binding.pry
    @event = Event.new(event_params)
    @family = Family.find(params[:family_id])
    @event.family_id = @family.id
    @event.user = current_user
    if @event.save
      redirect_to family_conflicts
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :comment)
  end
end
