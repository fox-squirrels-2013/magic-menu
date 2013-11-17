require 'spec_helper'

describe Menu do

	it "can create a new menu" do
		Menu.create(name: "Test")
		expect(Menu.last.name).to eq('Test')
	end

	describe "validations" do
		it { should validate_presence_of :name }
	end

	describe "relations" do
		it { should have_and_belong_to_many(:items) }
	end

end