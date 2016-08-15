require 'rails_helper'

describe Clinic do
  subject { build(:clinic) }

  it { should have_many(:addresses) }
  it { should have_many(:business_hours) }

  it "has a valid factory" do
    subject.valid?
    expect(subject.errors.messages).to eq({})
  end

end
