class Appointment < ActiveRecord::Base
  belongs_to :guest
  belongs_to :clinic
end
