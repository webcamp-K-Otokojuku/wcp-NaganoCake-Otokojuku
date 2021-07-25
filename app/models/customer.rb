class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shopping_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  has_many :cart_items, dependent: :destroy
  
  [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postcode, :tel].each do |v|
    validates v, presence: true
  end 
  
  enum is_deleted: { '退会': true, '有効': false }
  
  def active_for_authentication?
    super && self.is_deleted == "有効"
  end
  
  

end
