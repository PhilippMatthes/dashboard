class GmailController < ApplicationController
  def messages
    user_id = "me"
    result = GmailService.list_user_messages user_id, :q => "is:unread"
    render :json => result
  end

  def message
    user_id = "me"
    result = GmailService.get_user_message user_id, params[:id]
    render :json => result
  end
end
