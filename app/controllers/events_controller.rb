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
    @event.update(reminder_date: "", reminder_comment: "") if @event.add_reminder == false
    conflict = @event.conflict
    if conflict

      if @event.contact.present?
        conflict.events.each do |event|
          event.update(conflict: nil)
        end
        conflict.destroy
      else
        conflict.events.each do |event|
          event.set_conflict
        end
        conflict.destroy if conflict.reload.events.empty?
      end

    else
      @event.set_conflict
    end
    redirect_to family_conflicts_path
  end

  def destroy
    @event = Event.find(params[:id])
    conflict = @event.conflict
    @event.delete
    if conflict
      conflict.events.each do |event|
        event.set_conflict
      end
    end
    conflict.destroy if conflict && conflict.reload.events.empty?
    redirect_to family_conflicts_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_at, :end_at, :contact, :add_reminder, :reminder_date, :reminder_comment)
  end
end
