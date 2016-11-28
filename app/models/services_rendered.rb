class ServicesRendered < ActiveRecord::Base
  belongs_to :service
  belongs_to :support_request
end
