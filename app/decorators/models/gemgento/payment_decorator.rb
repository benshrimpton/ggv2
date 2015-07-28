Gemgento::Payment.class_eval do
  validates :cc_owner, :cc_type, :cc_exp_month, :cc_exp_year, :cc_cid, :cc_number, presence: true, if: -> { payable_type == 'Gemgento::Quote' && !is_redirecting_payment_method? && method != 'free' }
  validates_with Gemgento::CreditCardValidator, if: -> { payable_type == 'Gemgento::Quote' && !is_redirecting_payment_method? && method != 'free' }
end