Rails.application.routes.draw do
  get 'calendar/events'

  get 'gmail/messages'
  get 'gmail/message'
  get 'gmail/read'
  get 'gmail/trash'

  get 'welcome/index'
  root 'welcome#index'
end
