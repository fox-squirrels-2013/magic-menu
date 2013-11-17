require 'spec_helper'

describe Item do
  describe '#name' do
    it { should validate_presence_of(:name) }
  end

  describe '#price' do
    it { should validate_presence_of(:price) }
  end
end
