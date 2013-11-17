class Item < ActiveRecord::Base
	has_many :menu_items
	has_many :menus, through: :menu_items

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true

  # convert cents to dollars and prepend USD $ symbol
  def price_as_money
    "$%.2f" % (self.price / 100.0)
  end
end
