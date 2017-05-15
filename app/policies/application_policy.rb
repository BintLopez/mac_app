class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.admin? || user.board_member?
  end

  def new?
    user.admin? || user.board_member?
  end

  def update?
    user.admin? || user.board_member?
  end

  def edit?
    user.admin? || user.board_member?
  end

  def destroy?
    user.admin?
  end

  def rails_admin?(action)
    case action
    when :destroy
      user.admin?
    when :dashboard
      user.admin? || user.board_member?
    when :index
      user.admin? || user.board_member?
    when :show
      user.admin? || user.board_member?
    when :new
      user.admin? || user.board_member?
    when :edit
      user.admin? || user.board_member?
    when :export
      user.admin? || user.board_member?
    when :history
      user.admin? || user.board_member?
    when :show_in_app
      user.admin? || user.board_member?
    else
      raise ::Pundit::NotDefinedError, "unable to find policy #{action} for #{record}."
    end
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
