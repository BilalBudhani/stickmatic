require 'spec_helper'

describe OrderedPack do
  it { should belong_to(:order) }
  it { should belong_to(:pack) }
end
