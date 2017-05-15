# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Service::OFFERINGS.each do |service|
  return unless Service.where(type: service).blank?

  Service.new.tap {|s| s.update_attributes!(type: service) }
end



def board_positions
  {
    leah: "Executive Director",
    marie: "Director of Operations",
    hannah: "Director of Communications",
    veronica: "Director of Finance",
    abby: "Director of Outreach",
    nicole: "Director of Technology"
  }
end

def volunteers
  [
    "driver",
    "host",
    "childcare"
  ]
end

# board_positions.each do |name, position|
#   user = User.create(role: "board_member", email: "#{name}@midwestaccesscoalition.org", password: "password", password_confirmation: "password")
#   Organizer.create(position: position, board_member: true, user_id: user.id)
# end

# volunteers.each_with_index do |capacity, n|
#   user = User.create(first_name: "Wanda#{n}", last_name: "Starling#{n}", phone_number: "1231231234", role: capacity, email: "test#{n}@examplevol.com", password: "password", password_confirmation: "password")
#   Volunteer.create(gender: "F", user_id: user.id)
# end

# User.all.each do |u|
#   Address.create(street_address_1: "123 Fake St", city: "Springfield", state: "IL", zip_code: "60607", user: u)
# end
