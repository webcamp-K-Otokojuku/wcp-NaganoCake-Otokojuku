class Genre < ApplicationRecord

  has_many :items, dependent: :destroy

  validates :category, presence: true

end
