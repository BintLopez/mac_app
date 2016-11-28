class OnCallTimesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_dates_for_calendar
  # before_action :set_viewable_on_call_times

  # def index
  #   redirect_to main_app.root_path unless current_user
  # end

  # def new
  #   @call_times = OnCallTime.new
  # end 

  # def create 
  #   @call_time = OnCallTime.new(
  #     start_time: convert_to_date(params, :start_time), 
  #     end_time: convert_to_date(params, :end_time), 
  #     user_id: current_user.id
  #   )
  #   if @call_time.valid?
  #     @call_time.save!
  #     redirect_to on_call_times_path
  #   else
  #     flash[:notice] = @call_time.errors.full_messages
  #     render "on_call_times/index"
  #   end
  # end 

  # def destroy
  #   @call_time = OnCallTime.find(params[:id])
  #   @call_time.destroy
  #   redirect_to on_call_times_path
  # end

  # private

  # def convert_to_date(params, date_var)
  #   year  = params[date_var]["#{date_var}(1i)"]
  #   month = params[date_var]["#{date_var}(2i)"]
  #   day   = params[date_var]["#{date_var}(3i)"]
  #   "#{year}-#{month}-#{day}".to_date
  # end

  # def set_dates_for_calendar
  #   today = Date.today
  #   @beginning_of_month = Date.civil(today.year, today.month, 1)
  #   @end_of_month = Date.civil(today.year, today.month, -1)
  # end

  # def set_viewable_on_call_times
  #   @call_times ||= OnCallTime.viewable_for(current_user)
  # end
end

