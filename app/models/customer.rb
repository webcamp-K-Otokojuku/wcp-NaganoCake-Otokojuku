class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shopping_addresses, dependet: :destroy
  has_many :orders, dependet: :destroy
  
  has_many :cart_items, dependent: :destroy
  
end
