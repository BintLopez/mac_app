require 'rails_helper'

describe Address do

  subject { build(:address) }

  it { should belong_to(:addressable) }

  it "has a valid factory" do
    subject.valid?
    expect(subject.errors.messages).to eq({})
  end

end
