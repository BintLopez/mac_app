require 'rails_helper'
require 'users/create_or_update'

describe Users::CreateOrUpdate do
  let(:data) do
    {
      user: user_data,
      person: person_data,
      phone_number: phone_number_data,
      address: address_data
    }
  end

  let(:user_data) do
    {
      email: user_email,
    }
  end

  let(:person_data) do
    {
      first_name: "Ella",
      last_name: "Seabass",
    }
  end

  let(:phone_number_data) do
    {
      number: "5555555555",
      phone_number_type: 'cell'
    }
  end

  let(:address_data) do
    {
      street_address_1: "123 Unicorn Lane",
      street_address_2: "apt 3",
      city: "chicago",
      state: "IL",
      zip_code: "60647"
    }
  end

  let(:user_email) { "test@test.com" }
  
  let!(:user) do
    User.create!(
      role: 'admin',
      email: user_email,
      password: 'password'
    )
  end

  subject { described_class.call(user, data) }

  context 'when a user does not exist' do
    let(:user) { nil }
    
    it 'returns nil' do
      expect(subject).to be_nil
    end
  end

  context 'when a user does not have a person' do    
    context 'and no person_data was provided' do
      let(:person_data) { nil }

      it 'does not try to create a person for that user' do
        expect{ subject }.not_to change{ user.person }
      end
    end

    context 'when person data is provided' do
      it 'creates a person for that user' do
        subject
        expect(user.person).not_to be_nil
        expect(user.reload.person).to have_attributes(person_data)
      end
    end
  end

  context 'when a user person already exists' do
    let!(:person) { Person.create!(person_data.merge(user: user)) }

    context 'when the person does not have a phone number or address saved' do
      it 'creates address and phone number for the person' do
        expect{ subject }.to change{ person.addresses.count }.by(1).and change{ person.phone_numbers.count }.by(1)
      end
    end
  end
end
