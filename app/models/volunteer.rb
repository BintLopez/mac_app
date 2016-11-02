class Volunteer < ActiveRecord::Base
  has_one :host
  belongs_to :person
  has_many :volunteer_assignments
end
