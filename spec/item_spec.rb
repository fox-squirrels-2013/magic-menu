require 'spec_helper'

describe Item do
  it "can create a new item" do 
    Item.create!(description: "boo", price: 9 )
    expect([Item.last.description,Item.last.price]).to eq(["boo",9])
  end 

  

end
