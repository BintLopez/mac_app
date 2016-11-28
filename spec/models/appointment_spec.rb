require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to(:guest) }
  it { is_expected.to belong_to(:clinic) }
end
