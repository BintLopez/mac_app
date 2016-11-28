require 'rails_helper'

RSpec.describe Accommodation, type: :model do
  it { is_expected.to belong_to(:host) }
end
