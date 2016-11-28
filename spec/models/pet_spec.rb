require 'rails_helper'

RSpec.describe Pet, type: :model do
  it { is_expected.to belong_to(:host) }
end
