class PhoneNumber < ActiveRecord::Base
  belongs_to :callable, polymorphic: true
end
