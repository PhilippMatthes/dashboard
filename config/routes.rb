Rails.application.routes.draw do
  get 'calendar/events'
  get 'calendar/calendars'

  get 'gmail/labels'

  get 'welcome/index'
  root 'welcome#index'
end
