require 'spec_helper'

describe Menu do

  describe "create" do
    it "creates a new menu with valid information" do
      @menu = Menu.create name: "second breakfast"
      @menu.should be_an_instance_of Menu
    end
  end
end
