class Volunteer < ActiveRecord::Base
  has_one :host
  belongs_to :person
end
