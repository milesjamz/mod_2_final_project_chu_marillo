class User < ApplicationRecord

  has_secure_password

  validates_uniqueness_of :name
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  has_many :carts
  has_many :line_items, through: :carts
  has_many :comments
  has_many :items, through: :comments

  def create_cart
  	@cart = Cart.new(user_id: self.id, status: true, total_price: 0)
  	@cart.save
  end

end