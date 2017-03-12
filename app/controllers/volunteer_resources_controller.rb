require 'services/google_apps'

class VolunteerResourcesController < ApplicationController
  before_action :authenticate_user!

  def index
    @files = service_object.volunteer_resource_files
  end

  def service_object
    @service_object ||= Services::GoogleApps.new
  end
end
