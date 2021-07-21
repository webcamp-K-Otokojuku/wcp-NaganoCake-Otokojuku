class Item < ApplicationRecord

  belongs_to :genre
  

  has_many :cart_items, dependent: :destroy

  has_many :order_items, dependent: :destroy


  attachment :item_image
  
  def favorited_by?(cusomer)
    cart_items.where(customer_id: customer.id).exists?
  end


  # enum status: {
  #   "販売中": 0,
  #   "販売停止中": 1
  # }
  def tax_price
    (self.price * 1.08).round
  end

end
