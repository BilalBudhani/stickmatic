require 'spec_helper'

describe Pack do
  it { should belong_to(:user) }
  it { should have_many(:pack_items) }
  it { should have_one(:ordered_pack) }
  it { should have_one(:order) }
  it { should validate_presence_of(:user_id) }
  it { should accept_nested_attributes_for(:pack_items) }
end
