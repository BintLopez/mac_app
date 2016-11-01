require 'rails_helper'

RSpec.describe Companion, type: :model do
  it { is_expected.to belong_to(:guest) }
end
