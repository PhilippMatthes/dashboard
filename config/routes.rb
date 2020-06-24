Rails.application.routes.draw do
  get 'calendar/events'

  get 'gmail/labels'

  get 'welcome/index'
  root 'welcome#index'
end
