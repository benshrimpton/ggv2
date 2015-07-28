Gemgento::LineItem.class_eval do
  serialized_attr_accessor :giftcard_amount_custom, :giftcard_sender_name, :giftcard_sender_email,
                           :giftcard_recipient_name, :giftcard_recipient_email, :giftcard_message,
                           :giftcard_amount

  attr_accessor :giftcard_recipient_name_confirmation, :giftcard_recipient_email_confirmation

  validates :giftcard_recipient_name, :giftcard_recipient_email, confirmation: true

  # Get the associated Product price.
  #
  # @return [BigDecimal]
  def price
    return super.to_d unless super.nil?

    if product.magento_type == 'teamwork_cegiftcard'

      if self.options[:giftcard_amount] == 'custom'
        self.options[:giftcard_amount_custom].to_d

      else
          self.options[:giftcard_amount].to_d
      end

    elsif self.options[:custom_price]
      self.options[:custom_price].to_d

    else
      user_group = itemizable.user ? itemizable.user.user_group : nil
      product.price(user_group, itemizable.store, self.qty_ordered).to_d
    end

  end
end