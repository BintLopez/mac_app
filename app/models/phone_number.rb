class PhoneNumber < ActiveRecord::Base
  belongs_to :callable, polymorphic: true
  validate :validate_number

  VALID_NUMBER_LENGTH = 10.freeze

  def self.format_for_db(number)
    number.gsub(/\D/, "")
  end

  def pretty_number
    number.dup.insert('-', 3).insert('-', 7)
  end

  def validate_number
    number.length == VALID_NUMBER_LENGTH
  end
end
