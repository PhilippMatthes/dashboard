class CalendarController < ApplicationController
  def events
    calendar_list = CalendarService.list_calendar_lists()
    result = []
    calendar_list.items.each do |calendar|
      calendar_events = CalendarService
        .list_events(
          calendar.id,
          single_events: true,
          time_min: DateTime.now.rfc3339,
          time_max: (DateTime.now.midnight + 2).rfc3339
        )
        .items

      result << calendar_events.map { |calendar_event| {
        :calendar => calendar,
        :event => calendar_event
      }}
    end

    render :json => result.flatten
  end
end
