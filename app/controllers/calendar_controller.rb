class CalendarController < ApplicationController
  def calendars
    result = CalendarService.list_calendar_lists()
    render :json => result
  end

  def events
    result = CalendarService.list_events(
      params[:calendar_id] || "primary",
      max_results: params[:max_results] || 10,
      single_events: true,
      order_by: "startTime",
      time_min: DateTime.now.rfc3339
    )
    render :json => result
  end
end
