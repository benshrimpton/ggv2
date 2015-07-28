Gemgento::Subscriber.class_eval do
  after_create :send_email
  after_create :create_mailchimp
  
  def send_email
    SubscriberMailer.welcome(self).deliver
  end
  
  def create_mailchimp
    puts "here"
    gb = Gibbon::API.new('44eaae57775536fa02d21654e626eedb-us11')
    gb.lists.subscribe({ id: '1ba07c73eb', email: { email: self.email }, merge_vars: { FNAME: '', LNAME: '' }, double_optin: false })
  end

end