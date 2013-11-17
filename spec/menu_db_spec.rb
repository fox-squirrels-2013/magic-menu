require 'spec_helper'

describe Menu do
    it { should validate_presence_of(:name) }
    it { should have_many(:offerings) }
    it { should have_many(:items) }
end
