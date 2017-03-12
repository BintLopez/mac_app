require 'googleauth'
require 'google/apis/drive_v3'

module Services
  class GoogleApps

    SCOPES = [ Google::Apis::DriveV3::AUTH_DRIVE_METADATA_READONLY ]

    attr_reader :drive, :client

    def initialize
      @drive = Google::Apis::DriveV3::DriveService.new
      @client = drive.authorization = Google::Auth.get_application_default(SCOPES)
    end

    def volunteer_resource_files
      fetch_folder(ENV['VOLUNTEER_RESOURCES_FOLDER']).files
    end

    def fetch_folder(folder_id)
      authorize!
      drive.list_files(
        fields: 'files(id, name, parents)', 
        q: "'#{folder_id}' in parents"
      )
    end

    def authorize!
      client.fetch_access_token!
    end

  end
end
