require 'spec_helper'

describe Address do
  it { should belong_to(:order) }

  it { should validate_presence_of(:add1) }
  it { should validate_presence_of(:add2) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:landmark) }
  it { should validate_presence_of(:mobile) }

  it {should ensure_length_of(:mobile).is_equal_to(10) }
end
