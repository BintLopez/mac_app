class Clinic < ActiveRecord::Base
  has_many :addresses, as: :addressable
  has_many :emails, as: :emailable
  has_many :phone_numbers, as: :callable
end
