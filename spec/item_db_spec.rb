require 'spec_helper'

describe Item do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should have_many(:offerings) }
    it { should have_many(:menus) }

end
