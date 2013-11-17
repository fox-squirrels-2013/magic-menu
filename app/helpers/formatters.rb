helpers do
  def convert_price_to_cents(item)
    # p item[:price].to_d
    item[:price] = item[:price].to_d * 100
    item
  end

  def cents_to_dollars(cents)
    # p item[:price].to_d
    cents /= 100.0
  end
end