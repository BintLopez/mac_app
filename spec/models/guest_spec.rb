require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { is_expected.to belong_to(:support_request) }
  it { is_expected.to belong(:person) }
  it { is_expected.to have_many(:companions) }
end
