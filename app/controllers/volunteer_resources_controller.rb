require 'services/google_apps'

class VolunteerResourcesController < ApplicationController
  before_action :authenticate_user!

  def index
    @files = service_object.volunteer_resource_files
  end

  def show
    file_data = service_object.get_file_data(params[:id])
    file_name = service_object.class.volunteer_resource_files[params[:id]]
    send_data(file_data.force_encoding('BINARY'), filename: "#{file_name}.pdf", type: 'application/pdf', disposition: 'attachment')
  end

  def service_object
    @service_object ||= Services::GoogleApps.new
  end

end
