# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Service::OFFERINGS.each do |service|
  return unless Service.where(service_type: service).blank?
  Service.new.tap { |s| s.update_attributes!(service_type: service) }
end


board_positions =
  {
    leah:     'Executive Director',
    marie:    'Director of Operations',
    hannah:   'Director of Communications',
    veronica: 'Director of Finance',
    abby:     'Director of Outreach',
    nicole:   'Director of Technology'
  }


volunteers =
  [
    'driver',
    'host',
    'childcare'
  ]

User.create!(
  role:                  User::ADMIN,
  email:                 'nicole+admin@midwestaccesscoalition.org',
  password:              'password',
  password_confirmation: 'password'
)

board_positions.each do |name, _|
  User.create!(
    role:                  User::BOARD_MEMBER,
    email:                 "#{name}@midwestaccesscoalition.org",
    password:              'password',
    password_confirmation: 'password'
  )
end

# volunteers.each_with_index do |capacity, n|
#   user = User.create(first_name: 'Wanda#{n}', last_name: 'Starling#{n}', phone_number: '1231231234', role: capacity, email: 'test#{n}@examplevol.com', password: 'password', password_confirmation: 'password')
#   Volunteer.create(gender: 'F', user_id: user.id)
# end

# User.all.each do |u|
#   Address.create(street_address_1: '123 Fake St', city: 'Springfield', state: 'IL', zip_code: '60607', user: u)
# end
