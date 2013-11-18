require 'spec_helper'

describe Menu do
  describe "create" do
    before :each do
      @menu = Menu.create name: "second breakfast"
    end

    it "creates a new menu with valid information" do
      @menu.should be_an_instance_of Menu
    end
  end

  it { should have_many :items }

  it { should validate_uniqueness_of :name }
end

describe Item do
  describe "create" do
    before :each do
      @menu = Menu.create name: "snack"
      @item = Item.create name: "chips", price: "1.99"
    end

    it "adds an item" do
      @item.should be_an_instance_of Item
    end
  end

  it { should have_many :menus }
  
  it { should validate_uniqueness_of :name }
end
