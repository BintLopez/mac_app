require 'rails_helper'

RSpec.describe ServicesRendered, type: :model do
  it { is_expected.to belong_to(:support_request) }
  it { is_expected.to belong_to(:service) }
end
