class Email < ActiveRecord::Base
  belongs_to :emailable, polymorphic: true
end
