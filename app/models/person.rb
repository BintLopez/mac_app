class Person < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, as: :addressable
  has_many :phone_numbers, as: :callable
  has_many :emails, as: :emailable

  def age
    days = (Date.current - date_of_birth).floor
    days / 365
  end

  def phone_number
    contacts.current_phone_number
  end

  def email
    contacts.current_email
  end

  def address
    addresses.active_current
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
