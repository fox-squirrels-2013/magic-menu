require 'spec_helper'

describe Offering do
  it {should validate_presence_of(:item_id)}  
  it {should validate_presence_of(:menu_id)}  
  it {should validate_presence_of(:item_id)}  
  it {should belong_to(:menu)}
  it {should belong_to(:item)}  
end
