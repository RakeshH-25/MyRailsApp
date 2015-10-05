class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  validates :name, :address, :contact_no, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates_length_of :contact_no, :is => 10, :message =>  "Number doesnot contains 10 digit"

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
