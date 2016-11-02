class VolunteerAssignment < ActiveRecord::Base
  belongs_to :support_request
  belongs_to :volunteer
end
