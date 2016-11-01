class Person < ActiveRecord::Base
  has_many :addresses, as: :addressable
  has_many :contacts, as: :contactable
end
