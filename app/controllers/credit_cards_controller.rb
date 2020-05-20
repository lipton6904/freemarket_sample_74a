class CreditCardsController < ApplicationController
  require "payjp"

  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params["payjp_token"].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(
        user_id: current_user.id, 
        customer_id: customer.id, 
        card_id: customer.default_card
      )
      if @card.save
        redirect_to card_path(current_user.id)
      else
        redirect_to  new_credit_card_path
      end
    end
  end
  
end
