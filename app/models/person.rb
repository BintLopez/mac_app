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
    # TODO don't just go off last here
    phone_numbers.last
  end

  def email
    user.try(:email) || emails.last
  end

  def address
    addresses.last
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
