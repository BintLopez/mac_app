module Users
  class CreateOrUpdate
    attr_reader :user, :user_data, :person_data, :phone_number_data, :address_data

    def self.call(user, data_blob)
      new(user, data_blob).call
    end

    def initialize(user, data_blob)
      @user = user
      @user_data = data_blob[:user]
      @person_data = data_blob[:person]
      @phone_number_data = data_blob[:phone_number]
      @address_data = data_blob[:address]
    end

    def call
      return unless user
      update_user!
      create_or_update_person!
      create_or_update_phone_number!
      create_or_update_address!
    end

    private

    attr_writer :person

    def update_user!
      return unless user_data
      user.update_attributes!(user_data)
    end

    def create_or_update_person!
      return unless person_data
      if person
        person.update_attributes!(person_data)
      else
        Person.create(person_data.merge(user: user))
      end
    end

    def create_or_update_phone_number!
      return unless phone_number_data
      return unless person
      phone_number = PhoneNumber.format_for_db(phone_number_data[:number])
      existing_number = person.phone_numbers.find_by(number: phone_number)
      if existing_number
        existing_number.update_attributes!(phone_number_data)
      else
        person.phone_numbers.create!(phone_number_data)
      end
    end

    def create_or_update_address!
      return unless address_data
      return unless person
      existing_address = person.addresses.find_by(address_data)
      if existing_address
        existing_address.update_attributes!(address_data)
      else
        person.addresses.create!(address_data)
      end
    end

    def person
      @person ||= user.person
    end

  end
end
