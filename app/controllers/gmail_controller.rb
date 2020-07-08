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

  def read
    user_id = "me"
    request = Google::Apis::GmailV1::ModifyMessageRequest.new
    request.remove_label_ids = ["UNREAD"]
    result = GmailService.modify_message user_id, params[:id], request
    render :json => result
  end

  def trash
    user_id = "me"
    result = GmailService.trash_user_message user_id, params[:id]
    render :json => result
  end
end
