class UserPresenter
  attr_reader :user

  TITLEIZE_FIELDS = %i{
    first_name
    last_name
    full_name
    address_line_1
    address_line_2
    city
    full_address
    gender
    role
    on_call
  }

  def self.data_for(user)
    raise ArgumentError.new("Unexpected user type for #{user}") unless user.is_a? User
    new(user)
  end

  def initialize user
    @user = user
  end

  def call
    user_data
  end

  def base_data
    user_data.merge!(address_data)
  end

  def user_data
    {
      first_name: person.try(:first_name),
      last_name: person.try(:last_name),
      email: user.email,
      full_name: person.try(:full_name),
      phone_number: person.try(:phone_number),
    }
  end

  def address_data
    return {} unless address
    {
      address_line_1: address.street_address_1,
      address_line_2: address.street_address_2,
      city: address.city,
      state: address.state.try(:upcase),
      zip: address.zip_code,
      full_address: address.full_address,
    }
  end

  def organizer_data
    {
      board_member: user.role == :board_member,
      position: volunteer.try(:position),
      role: user.role
    }
  end

  def address
    person.try(:address)
  end

  def person
    user.person
  end

  def volunteer
    person.try(:volunteer)
  end

  private

  def make_titleized(data)
    data.keys.each do |k|
      data[k].try(:titleize) if TITLEIZE_FIELDS.include? k
    end
    data
  end

end
