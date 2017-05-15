class OrganizerPresenter < UserPresenter
  attr_reader :organizer, :user, :address

  def initialize(user)
    @user = user
    @address = user.try(:address)
  end

  def call
    make_titleized(data)
  end

  def data
    organizer_data.merge!(base_data)
  end

  def organizer_data
    {
      role: user.board_member,
      position: organizer.position,
    }
  end

end
