class Order < ActiveRecord::Base
  
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = [ "наличные", "кредитная карта", "иное" ]
  STATUS_TYPES = [ "новый", "в работе", "ожидает оплаты", "завершен", "отменен" ]

  validates :name, :adress, :email, :phone, :status, :pay_type, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :status, inclusion: STATUS_TYPES
  
  def add_line_items_from_cart(cart)
      cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
      end
  end
end