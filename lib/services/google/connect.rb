require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

module Google
  class Connect

    APPLICATION_NAME = 'MAC Scheduling'
    CLIENT_SECRETS_PATH = 'google_integration.json'
    OOB_URI = 'http://localhost:3000'
    CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                                 "calendar-ruby-quickstart.yaml")
    DEFAULT_SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

    def authorize(scope: DEFAULT_SCOPE)
      FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

      client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
      authorizer = Google::Auth::UserAuthorizer.new(
        client_id, scope, token_store)
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      if credentials.nil?
        url = authorizer.get_authorization_url(
          base_url: OOB_URI)
        puts "Open the following URL in the browser and enter the " +
             "resulting code after authorization"
        puts url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: OOB_URI)
      end
      credentials
    end

  end
end
