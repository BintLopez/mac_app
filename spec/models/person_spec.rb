require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:addresses) }
  it { is_expected.to have_many(:contacts) }

  describe '#age' do
    let(:person) { described_class.new(date_of_birth: Date.new(1988,11,21)) }

    it 'returns the current age' do
      expect(person.age).to eq(28)
    end
  end
end
