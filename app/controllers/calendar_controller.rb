class CalendarController < ApplicationController
  def events
    calendar_list = CalendarService.list_calendar_lists()
    result = calendar_list.items
      .map { |item| item.id }
      .map { |id| CalendarService
        .list_events(
          id,
          single_events: true,
          time_min: DateTime.now.rfc3339,
          time_max: (DateTime.now.midnight + 2).rfc3339
        )
        .items
      }
      .flatten
    render :json => result
  end
end
