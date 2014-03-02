require 'spec_helper'

describe PackItem do
  it { should belong_to(:pack) }
  # it { should validate_presence_of(:pack_id) } # Doesn't work with nested attributes
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:thumb) }
  it { should validate_presence_of(:uid) }
end
