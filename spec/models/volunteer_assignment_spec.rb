require 'rails_helper'

RSpec.describe VolunteerAssignment, type: :model do
  it { is_expected.to belong_to(:support_request) }
  it { is_expected.to belong_to(:volunteer) }
end
