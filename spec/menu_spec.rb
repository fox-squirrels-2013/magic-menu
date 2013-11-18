require 'spec_helper'

describe Menu do
  describe "create" do
    before :each do
      @menu = Menu.create name: "breakfast"
    end
    it "creates a new menu when name is valid" do
      @menu.should be_an_instance_of Menu
    end
  end
  it { should have_many :items }
end

describe Item do
  describe "create" do
    before :each do
      @item = Item.create name: "eggs", price: "2.49"
    end
    it "creates a new item when name is valid" do
      @item.should be_an_instance_of Item
    end
  end
   it { should have_many :menus }
end


describe ItemMenu do
  describe "create" do
    before :each do
      @item = Item.create name: "cheeseburger", price: "2.49"
      @menu = Menu.create name: "lunch"
      @itemmenu = ItemMenu.create item_id: @item.id, menu_id: @menu.id
    end
    it "creates a new item menu relationship" do
      @itemmenu.should be_an_instance_of ItemMenu
    end
  end

end
