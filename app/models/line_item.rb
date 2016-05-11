class LineItem < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: {grater_then_or_equal_to: 0}
  
  validates_associated :order, message: 'Сумма заказа не менее 0 руб.'
  
  def total_price
  product.price * quantity
  end

end
