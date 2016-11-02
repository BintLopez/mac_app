require 'rails_helper'

RSpec.describe SupportRequest, type: :model do
  it { is_expected.to have_many(:reimbursement_requests) }
  it { is_expected.to have_many(:volunteer_assignments) }
end
