class Pet < ActiveRecord::Base
  belongs_to(:host)
end
