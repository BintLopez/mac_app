class Host < ActiveRecord::Base
  belongs_to :volunteer
  has_many :accommodations
  has_many :pets
end
