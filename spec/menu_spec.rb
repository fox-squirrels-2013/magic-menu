require 'spec_helper'

describe Menu do
  it "can create a new menu" do 
    Menu.create(description: "Test1") 
    expect(Menu.last.description).to eq("Test1")
  end 
  describe "validations" do 
    it { should validate_presence_of :description}
  end 
end
