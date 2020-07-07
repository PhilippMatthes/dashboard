Rails.application.routes.draw do
  get 'calendar/events'

  get 'gmail/messages'
  get 'gmail/message'

  get 'welcome/index'
  root 'welcome#index'
end
