Gemgento::User::RegistrationSessionController.class_eval do

  def after_register_path
    user_home_path
  end

  def after_sign_in_path
    user_home_path
  end

end