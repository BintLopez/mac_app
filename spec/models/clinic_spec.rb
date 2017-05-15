require 'rails_helper'

describe Clinic do
  subject { build(:clinic) }

  it { should have_many(:addresses) }
  it { should have_many(:emails) }
  it { should have_many(:phone_numbers) }

  it "has a valid factory" do
    subject.valid?
    expect(subject.errors.messages).to eq({})
  end

end
