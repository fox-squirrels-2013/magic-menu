require 'spec_helper'

describe "web requests" do
  it "creates a new menu" do
    params = { 'menu' => {'name' => "Yumilicious Dinner"} }
    expect {post '/menus/new', params}.to change {Menu.all.length}.by(1)
  end

  it "does not create menu without a name" do
    params = { 'menu' => {'name' => "" } }
    expect {post '/menus', params}.to change {Menu.all.length}.by(0)
  end

  # it "creates an item with a price" do
  #   params = { 'item' => {'name' => "Filet Mignon",
  #                               'price' => 17.69 } }
  #   post '/items', params
  #   Item.last.price.should == 17.69
  # end
end