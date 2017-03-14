class HomeController < ApplicationController
  before_action :load_user, :load_user_data
  # before_action :set_dates_for_calendar
  # before_action :set_viewable_on_call_times
  before_action :load_board_members

  def index
    if current_user
      redirect_to dashboards_board_path
    else
      redirect_to new_user_session_path
    end
  end

  private

  def load_user
    @user = current_user
  end

  def load_user_data
    @user_data = UserPresenter.data_for(current_user).call if @user
  end

  def set_dates_for_calendar
    today = Date.current
    @beginning_of_month = Date.civil(today.year, today.month, 1)
    @end_of_month = Date.civil(today.year, today.month, -1)
  end

  def set_viewable_on_call_times
    @call_times ||= OnCallTime.viewable_for(current_user) if current_user
  end

  def load_board_members
    @board_members ||= BoardPresenter.present(current_user)
  end
end
