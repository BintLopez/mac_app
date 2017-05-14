require 'rails_helper'

describe User do

  it { is_expected.to have_one(:person) }
  it { is_expected.to have_many(:addresses) }

  it { is_expected.to validate_inclusion_of(:role).in_array(User::ROLES) }

end
