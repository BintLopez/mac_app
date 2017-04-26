class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, :load_user_data

  def board
    set_dates_for_calendar
  end

  private

  def set_dates_for_calendar
    today = Date.current
    @beginning_of_month = Date.civil(today.year, today.month, 1)
    @end_of_month = Date.civil(today.year, today.month, -1)
  end

  def load_user
    @user = current_user.reload
  end

  def load_user_data
    @user_data = UserPresenter.data_for(current_user).call
  end

end
