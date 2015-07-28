Gemgento::User.class_eval do
  after_create :send_email

  def send_email
    SubscriberMailer.sign_up_welcome_email(self).deliver
  end

  def teamwork_id
    @teamwork_id ||= begin
      response = Teamwork::Customers.search(self.email)
      response[:entities].any? ? response[:entities].first[:customer_id] : nil
    end
  end
end