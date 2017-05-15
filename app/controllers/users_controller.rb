 require 'users/create_or_update'

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, :load_user_data, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def show
  end

  def update
    Users::CreateOrUpdate.call(@user, params_sans_empty_strings)
    redirect_to dashboards_board_path
  end

  private

  def all_params
    expected = %i(user person address phone_number)
    expected.each_with_object({}) do |expected, allowed|
      allowed.tap do |allow|
        permitted_keys = method("#{expected}_attrs").call
        allowed[expected] = if expected == :user
          params.require(expected).permit(permitted_keys)
        else
          params.require(:user).require(expected).permit(permitted_keys)
        end
      end
    end.compact.deep_symbolize_keys
  end

  def params_sans_empty_strings
    all_params.deep_dup.inject({}) do |new_hash, (k,v)|
      if v.present?
        new_hash[k] = v.is_a?(Hash) ? v.delete_if{|k,v| v.empty?} : v
      end
      new_hash
    end
  end

  def user_attrs
    %i(email)
  end

  def phone_number_attrs
    %i(number phone_number_type)
  end

  def address_attrs
    %i(street_address_1 street_address_2 city state zip_code)
  end

  def person_attrs
    %i(first_name last_name)
  end

  def load_user
    @user = current_user.reload
  end

  def load_user_data
    @user_data = UserPresenter.data_for(current_user).call
  end

end
