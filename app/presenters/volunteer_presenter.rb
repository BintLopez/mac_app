class VolunteerPresenter < UserPresenter
  attr_reader :volunteer, :user, :address

  def initialize(user)
    @user = user
    @volunteer = user.volunteer
    @address = user.try(:address)
  end

  def call
    volunteer_data.merge!(base_data)
    make_titleized(volunteer_data)
    volunteer_data
  end

  def volunteer_data
    {
      gender: person.gender,
      position: volunteer.position,
      on_call: volunteer.on_call,
      age: person.age,
    }
  end

  def person
    user.person
  end

end
