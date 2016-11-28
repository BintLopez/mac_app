require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  it { is_expected.to belong_to(:person) }
  it { is_expected.to have_one(:host) }
  it { is_expected.to have_many(:volunteer_assignments) }
end
