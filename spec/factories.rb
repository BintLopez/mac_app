FactoryGirl.define do
  factory :volunteer_assignment do
    support_request_id 1
    volunteer_id 1
    status "MyString"
    notes "MyText"
  end
  factory :contact do
    do_not_contact false
  end
  factory :service do
    type ""
  end
  factory :services_rendered do
    service_id 1
    support_request_id 1
  end
  factory :appointment do
    clinic_id 1
    appt_time "2016-11-01 00:26:55"
    support_request_id 1
  end
  factory :support_request do
    completed false
    notes "MyText"
    date_of_contact "2016-11-01"
    date_of_assistance "2016-11-01"
    referred_from "MyString"
  end
  factory :companion do
    guest_id 1
    person_id 1
  end
  factory :guest do
    notes "MyText"
    person_id 1
    support_request_id 1
    allergies false
    male_okay false
    pets_okay false
  end
  factory :reimbursement_request do
    support_request_id 1
    assigned_to 1
    requested_by 1
    status "MyString"
    receipt_upload "MyString"
    amount_cents 1
  end
  factory :pet do
    type ""
    size "MyString"
    behavior "MyString"
    host_id 1
  end
  factory :accommodation do
    private false
    bedding "MyString"
    inactive false
    host_id 1
  end
  factory :host do
    volunteer_id 1
    guest_capacity 1
    inactive false
  end
  factory :contactable do
    contact_id 1
    contactable_id 1
    contactable_type "MyString"
  end
  factory :addressable do
    address_id 1
    addressable_id 1
    addressable_type "MyString"
  end
  factory :volunteer do
    training_date "2016-10-31"
    can_drive false
    docs_received_date "2016-10-31"
    notes "MyText"
    inactive false
  end
  factory :phone_number do
    number "MyString"
    do_not_call false
    type ""
    contact_id 1
  end
  factory :email do
    address "MyString"
    emailable_id 1
    bad_email false
  end
  factory :person do
    
  end

  factory :address do 
    street_address_1 Faker::Address.street_address
    street_address_2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state
    zip_code Faker::Address.zip
  end

  factory :business_hour do 
    open_time DateTime.parse("2016-04-01 00:38:41")
    close_time DateTime.parse("2016-04-01 00:38:41")
    day_of_week 1
  end

  factory :clinic do 
    title Faker::Name.title  
    transit_accessible Faker::Lorem.word 
    abortion_types Faker::Lorem.word
    site_url Faker::Internet.url 
    map_url Faker::Internet.url 
  end

  factory :organizer do 
    position Faker::Lorem.word
    board_member false
    user_id 1
  end

  factory :user do 
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    phone_number Faker::PhoneNumber.phone_number
    role Faker::Lorem.word
    password "password"
  end

  factory :vehicle do 
    make Faker::Lorem.word
    model Faker::Lorem.word
    color Faker::Lorem.word
    license_plate_number Faker::Lorem.word
    volunteer_id 1
  end
end
