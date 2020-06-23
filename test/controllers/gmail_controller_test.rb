require 'test_helper'

class GmailControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gmail_index_url
    assert_response :success
  end

end
