class CRUDPolicy

  attr_reader :user, :resource

  def initialize(user, resource)
    @user     = user
    @resource = resource
  end

  def create?
    user.admin? ||
      user.board_member? ||
      coordinator_and_volunteer_management_resource? ||
      volunteer_and_own_profile?
  end

  def read?
    user.admin? ||
      user.board_member? ||
      coordinator_and_volunteer_management_resource? ||
      volunteer_and_own_profile? ||
      volunteer_and_volunteer_resource?
  end

  def update?
    user.admin? ||
      user.board_member? ||
      coordinator_and_volunteer_management_resource? ||
      volunteer_and_own_profile?
  end

  def delete?
    user.admin?
  end

  private

  def coordinator_and_volunteer_management_resource?
    false
  end

  def volunteer_and_own_profile?
    false
  end

  def volunteer_and_volunteer_resource?
    false
  end
end
