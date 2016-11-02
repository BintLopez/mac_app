class SupportRequest < ActiveRecord::Base
  has_many :reimbursement_requests
  has_many :volunteer_assignments
end
