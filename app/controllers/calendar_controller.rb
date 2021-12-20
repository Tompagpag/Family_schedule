class CalendarController < ApplicationController
  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]
    response = client.fetch_access_token!
    session[:authorization] = response

    redirect_to calendar_import_url
  end

  def redirect
    client = Signet::OAuth2::Client.new(client_options)
    redirect_to client.authorization_uri.to_s
  end

  def import
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    service.list_events('primary').items.each do |event|
      if event.status != "cancelled"
        user = User.find_by(email: event.creator.email)
        event_if_exist = Event.find_by(identifier: event.id)
        if event_if_exist
          event_if_exist.update(
            title: event.summary,
            start_at: event.start.date_time + 1.hours,
            end_at: event.end.date_time + 1.hours,
            family_member: user.family_member,
            family: user.family
          )
        else
          Event.create!(
            title: event.summary,
            start_at: event.start.date_time + 1.hours,
            end_at: event.end.date_time + 1.hours,
            family_member: user.family_member,
            family: user.family,
            identifier: event.id
          )
        end
      end
    end
    redirect_to family_conflicts_path(current_user.family)
  end

  private

  def client_options
    {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    }
  end

  def callback_url
    if Rails.env.production?
      "https://www.family-schedule.co.uk/calendar/callback"
    else
      calendar_callback_url
    end
  end
end
