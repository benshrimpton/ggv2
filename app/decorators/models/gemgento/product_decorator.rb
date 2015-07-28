Gemgento::Product.class_eval do
  
  has_many :related_products

  def in_stock_simples
    self.simple_products.select{|p| p.in_stock?}
  end

end