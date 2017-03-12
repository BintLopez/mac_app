require 'services/google_apps'

class VolunteerResourcesController < ApplicationController
  before_action :authenticate_user!

  def index
    @files = service_object.volunteer_resource_files_by_name
  end

  def download
    file_data = service_object.get_file_data(params[:id])
    file_name = service_object.volunteer_resource_files[params[:id]]

    respond_to do |format|
      format.pdf do
        send_data(file_data.force_encoding('BINARY'), filename: "#{file_name}.pdf", type: 'application/pdf', disposition: 'inline')
      end
    end
  end

  def show
    @file = {
      id: params[:id],
      name: service_object.volunteer_resource_files[params[:id]]
    }
  end

  def service_object
    @service_object ||= Services::GoogleApps.new
  end

end
