require 'rails_helper'

RSpec.describe ReimbursementRequest, type: :model do
  it { is_expected.to belong_to(:user).with_foreign_key(:assigned_to) }
  it { is_expected.to belong_to(:person).with_foreign_key(:requested_by) }
end
