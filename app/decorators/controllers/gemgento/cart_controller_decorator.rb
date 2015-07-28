Gemgento::CartController.class_eval do

  def line_item_params
    params.require(:line_item).permit(
        :id, :product_id, :qty_ordered, :async,
        :giftcard_amount_custom, :giftcard_recipient_name, :giftcard_recipient_name_confirmation, :giftcard_message,
        :giftcard_recipient_email, :giftcard_recipient_email_confirmation, :giftcard_sender_name, :giftcard_amount,
        :giftcard_sender_email
    )
  end

end