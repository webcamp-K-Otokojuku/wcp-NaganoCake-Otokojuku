class Item < ApplicationRecord

  belongs_to :genre


  has_many :cart_items, dependent: :destroy

  has_many :order_items, dependent: :destroy

  [:name, :price, :introduction].each do |v|
    validates v, presence: true
  end



  attachment :item_image

  def favorited_by?(cusomer)
    cart_items.where(customer_id: customer.id).exists?
  end



  def tax_price
    (self.price * 1.08).floor
  end

end
