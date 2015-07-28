class User::GiftCardsController < Gemgento::UsersController

  def index
    @gift_cards = Teamwork::CEGiftcards.list(current_user.teamwork_id)[:entities]
  end

  def create
    begin
      Teamwork::CEGiftcards.assign(gift_card_params[:code], current_user.teamwork_id)
      redirect_to main_app.user_gift_cards_path, notice: 'Gift Card was successfully redeemed.'

    rescue RuntimeError => e
      Rails.logger.error e
      redirect_to main_app.user_gift_cards_path, alert: 'Invalid Gift Card code.'
    end
  end

  private

  def gift_card_params
    params.require(:gift_card).permit(:code)
  end

end
