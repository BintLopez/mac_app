class Person < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, as: :addressable
  has_many :contacts, as: :contactable

  def age
    days = (Date.current - date_of_birth).floor
    days / 365
  end

  def phone_number
    contacts.try(:current_phone_number)
  end

  def email
    contacts.current_email
  end

  def address
    addresses.last
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
