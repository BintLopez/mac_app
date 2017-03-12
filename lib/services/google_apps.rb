require 'googleauth'
require 'google/apis/drive_v3'

module Services
  class GoogleApps

    SCOPES = [ Google::Apis::DriveV3::AUTH_DRIVE_METADATA_READONLY ]

    attr_reader :drive_service, :client

    def initialize
      @drive_service = Google::Apis::DriveV3::DriveService.new
      @client = drive_service.authorization = Google::Auth.get_application_default(SCOPES)
    end

    def fetch_folder(id)
      authorize!
    end

    def authorize!
      client.fetch_access_token!
    end

  end
end
