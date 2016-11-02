require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should have_many(:addresses) }
  it { should have_many(:contacts) }
end
