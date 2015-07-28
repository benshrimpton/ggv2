class Teamwork::CEGiftcards

  def self.list(customer_id = nil)
    Teamwork.call('giftcards/list', customerID: customer_id)
  end

  def self.check(giftcard_id)
    Teamwork.call('giftcards/check', giftcardID: giftcard_id)
  end

  def self.assign(giftcard_id, customer_id)
    Teamwork.call('giftcards/assign', giftcardID: giftcard_id, customerID: customer_id)
  end

end