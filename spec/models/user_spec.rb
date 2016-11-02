require 'rails_helper'

describe User do

  it { should have_one(:person) }
  it { should have_many(:addresses) }

end
