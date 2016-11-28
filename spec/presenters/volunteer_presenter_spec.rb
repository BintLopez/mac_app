require 'rails_helper'

describe VolunteerPresenter do
  let!(:user) { User.create(
    first_name: "bob",
    last_name: "blahblah",
    email: "bob@lawblog.com",
    address_id: address.id
  )}
  let(:volunteer) { Volunteer.create(
    user_id: user.id,
    gender: "m",
    capacity: "driver",
    on_call: false,
  )}
  let(:address) { Address.create(
    street_address_1: "123 sesame street",
    street_address_2: "banana stand",
    city: "chicago",
    state: "il",
    zip_code: "60601",
  )}

  let(:expected_data) {
    {
      gender: "M",
      role: "Driver",
      on_call: False,
      first_name: "Bob",
      last_name: "Blahblah",
      email: "bob@lawblog.com",
      age: 28,
      full_name: "Bob Blahblah",
      address_line_1: "123 Sesame Street",
      address_line_2: "Banana Stand",
      city: "Chicago",
      state: "IL",
      zip: "60601",
      full_address: "123 Sesame Street Banana Stand, Chicago, IL 60601",
    }
  }
  
  xit "produces expected data" do
    data = VolunteerPresenter.new(volunteer).present
    binding.pry
    expect(data).to eq(expected_data)
  end

end
