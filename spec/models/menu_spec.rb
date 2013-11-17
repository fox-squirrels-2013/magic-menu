require 'spec_helper'

describe "Menu" do

  describe "validations" do
    it { should validate_presence_of :name }
  end

end