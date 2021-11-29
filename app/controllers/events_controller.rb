class EventsController < ApplicationController
  extend SimpleCalendar

  def new
    @family = Family.find(params[:family_id])
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @family = Family.find(params[:family_id])
    @event.family = @family
    @event.family_member = FamilyMember.find(params.dig(:event, :family_member)) if params.dig(:event, :family_member).present?

    if @event.save
      redirect_to family_conflicts_path
    else
      render :new
    end
  end

  def edit
    @family = Family.find(params[:family_id])
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    conflict = @event.conflict

    if conflict
      conflict.events.each do |event|
        event.set_conflict
        p "set conflicts for #{event}"
      end
    else
      @event.set_conflict
    end

    conflict.destroy if conflict && conflict.reload.events.empty?

    redirect_to family_conflicts_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to family_conflicts_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_at, :end_at, :comment)
  end
end
