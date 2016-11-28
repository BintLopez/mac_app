require 'rails_helper'

RSpec.describe Email, type: :model do
  it { is_expected.to belong_to(:contact) }
end
