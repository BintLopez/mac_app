require 'rails_helper'

RSpec.describe Host, type: :model do
  it { is_expected.to have_many(:accommodations) }
end
