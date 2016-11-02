class ReimbursementRequest < ActiveRecord::Base
  belongs_to :person, foreign_key: 'requested_by'
  belongs_to :user, foreign_key: 'assigned_to'
end
