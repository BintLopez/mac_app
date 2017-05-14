class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, :load_user_data, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def show
  end

  def update
    current_user.update_attributes(user_params)

    person = update_or_create_person
    update_or_create_address_for(person)

    redirect_to dashboards_board_path
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

  def address_params
    params.require(:user).require(:address).permit(:street_address_1, :street_address_2, :city, :state, :zip_code)
  end

  def person_params
    params.require(:user).require(:person).permit(:first_name, :last_name)
  end

  def params_present_for?(assoc)
    params["user"]["#{assoc}"].values.any? {|v| !v.blank? }
  end

  def update_or_create_address_for(person)
    return unless person && params_present_for?('address')
    if (address = current_user.address)
      address.update_attributes(address_params)
    else
      person.addresses.create(address_params)
    end
  end

  def update_or_create_person
    return current_user.person unless params_present_for?('person')
    if (person = current_user.person)
      person.tap { |p| p.update_attributes!(person_params) }
    else
      Person.create(person_params.merge(user: current_user))
    end
  end

  def load_user
    @user = current_user.reload
  end

  def load_user_data
    @user_data = UserPresenter.data_for(current_user).call
  end

end
