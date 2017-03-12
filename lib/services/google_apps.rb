require 'googleauth'
require 'google/apis/drive_v3'

module Services
  class GoogleApps

    SCOPES = [ Google::Apis::DriveV3::AUTH_DRIVE ]

    attr_reader :drive, :client

    def initialize
      @drive = Google::Apis::DriveV3::DriveService.new
      @client = drive.authorization = Google::Auth.get_application_default(SCOPES)
    end

    def volunteer_resource_files
      @@volunteer_resource_files ||= files_in_folder(ENV['VOLUNTEER_RESOURCES_FOLDER']).each_with_object({}) do |file, volunteer_resource_files|
        volunteer_resource_files[file.id] = file.name
      end
    end

    def volunteer_resource_files_by_name
      @@volunteer_resource_files_by_name ||= volunteer_resource_files.invert.sort_by{|key, _| key}
    end

    def get_file_data(file_id)
      drive.export_file(file_id, 'application/pdf')
    end

    def files_in_folder(folder_id)
      authorize!
      drive.list_files(
        fields: 'files(id, name, parents)', 
        q: "'#{folder_id}' in parents"
      ).files
    end

    def authorize!
      client.fetch_access_token!
    end

  end
end
