require 'spec_helper'

describe Item do

	it "can create a new item" do
		i = Item.create(name: "Test", price: 123)
		expect([i.name, i.price]).to eq(['Test', 123])
	end

	describe "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :price }
		it { should allow_value(458).for(:price) }
    	it { should_not allow_value("$4.56").for(:price) }
    	it { should_not allow_value("4.56").for(:price) }
	end

	describe "relations" do
		# it { should have_and_belongs_to(:menu) }
		it { should have_many(:menus).through(:items_menus) }
	end


end