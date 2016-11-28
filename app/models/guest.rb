class Guest < ActiveRecord::Base
  belongs_to :support_request
  belongs_to :person
  has_many :companions
end
