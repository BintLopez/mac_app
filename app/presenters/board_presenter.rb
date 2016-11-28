class BoardPresenter
  attr_reader :user

  def self.present(user)
    new(user).call
  end

  def initialize(user)
    @user = user
  end

  def call
    return nil unless user
    board_data
  end

  def board_data
    board_members.map do |bm|
      OrganizerPresenter.new(bm.user).call
    end
  end

  def board_members
    @board_members ||= User.where(role: User::BOARD_MEMBER)
  end
end
