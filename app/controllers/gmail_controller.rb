class GmailController < ApplicationController
  def labels
    user_id = "me"
    result = GmailService.list_user_labels user_id
    render :json => result.labels
  end
end
