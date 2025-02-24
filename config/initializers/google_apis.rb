require "google/apis/calendar_v3"
require "google/apis/gmail_v1"
require "googleauth"
require "googleauth/stores/file_token_store"
require "date"
require "fileutils"


OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
CREDENTIALS_PATH = "credentials/credentials.json".freeze


if !File.file?(CREDENTIALS_PATH)
  raise "credentials.json not found. Download it from the google console " \
        "and drop it into credentials/credentials.json."
end


##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize(token_path, scope)
  client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
  token_store = Google::Auth::Stores::FileTokenStore.new file: token_path
  authorizer = Google::Auth::UserAuthorizer.new client_id, scope, token_store
  user_id = "default"
  credentials = authorizer.get_credentials user_id
  if credentials.nil?
    url = authorizer.get_authorization_url base_url: OOB_URI
    puts "Open the following URL in the browser and enter the " \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end


def authorize_calendar
  authorize(
    "credentials/google_calendar_token.yaml",
    Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY
  )
end


def authorize_gmail
  authorize(
    "credentials/gmail_token.yaml",
    [
      Google::Apis::GmailV1::AUTH_GMAIL_READONLY,
      Google::Apis::GmailV1::AUTH_GMAIL_MODIFY,
    ]
  )
end


APPLICATION_NAME = "Dashboard".freeze

::CalendarService = Google::Apis::CalendarV3::CalendarService.new
::CalendarService.client_options.application_name = APPLICATION_NAME
::CalendarService.authorization = authorize_calendar

::GmailService = Google::Apis::GmailV1::GmailService.new
::GmailService.client_options.application_name = APPLICATION_NAME
::GmailService.authorization = authorize_gmail
