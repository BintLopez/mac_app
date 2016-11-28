class VolunteersController < ApplicationController
  # before_action :authenticate_user!, :load_volunteer, :load_volunteer_data

  def index
    if current_user #&& current_user.organizer
  	 @volunteers = Volunteer.all
    else
      redirect_to main_app.root_path
    end
  end

  def new
  end

  def create
    # Create new address object
    @address = Address.new(
      params.require(
        :volunteer
        ).permit(
          :street_address_1,
          :street_address_2,
          :city,
          :state,
          :zip_code
        )
      )
    @address.save!

    # Create new user object
    @user = User.new(params.require(:volunteer).permit(:first_name,
    																							     :last_name,
                                                       :email,
                                                       :phone_number,
                                                       :password))
    @user.role = 'volunteer'
    @user.address_id = @address.id
    @user.save!

    # Create new volunteer object
    @volunteer = Volunteer.new(params.require(:volunteer).permit(:gender,
                                                                 :on_call,
                                                                 :capacity))

    @volunteer.user_id = @user.id
    @volunteer.save!

    redirect_to @volunteer
  end


  def edit
  end

  def update
    @volunteer.update_attributes(params.require(:volunteer).permit(:on_call,
                                                                  :gender,
                                                                  :capacity))
    @user = @volunteer.user
    @user.update_attributes(params.require(:volunteer)
                                  .require(:user_attributes)
                                  .permit(:first_name,
                                          :last_name,
                                          :email,
                                          :phone_number))
    @address = @user.address
    if @address
      @address.update_attributes(params.require(:volunteer)
                                     .require(:user_attributes)
                                     .require(:address_attributes)
                                     .permit(:street_address_1,
                                             :street_address_2,
                                             :city,
                                             :state,
                                             :zip_code))
    end
    redirect_to @volunteer
  end

  def show
  end

  def destroy
  	@volunteer.destroy!

  	redirect_to volunteers_path
  end

  private

  def load_volunteer
    @volunteer = current_user.volunteer
    @volunteer = Volunteer.find(params[:id]) if params[:id] && current_user.organizer
  end

  def load_volunteer_data
    @volunteer_data = UserPresenter.data_for(@volunteer.user).call if @volunteer
  end
end
