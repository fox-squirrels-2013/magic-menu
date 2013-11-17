require 'spec_helper'

describe Item do

	it "can create a new item" do
		i = Item.create!(name: "Test", price: 123)
		expect([i.name, i.price]).to eq(['Test', 123])
	end

	describe "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :price }
	end

end