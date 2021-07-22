class ShoppingAddress < ApplicationRecord

  belongs_to :customer

  def shopping_address_orders_view
    "〒" + self.postcode + " " + self.address + " " + self.name
  end

end
