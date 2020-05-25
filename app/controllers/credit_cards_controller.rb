class CreditCardsController < ApplicationController
  require "payjp"

  def new
    @card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if @card.exists? #showアクションにリダイレクト
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
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to  credit_card_path(@card)
      else
        redirect_to  new_credit_card_path
      end
    end
  end

  def show
    @card = CreditCard.find_by(user_id: current_user.id) #ログインユーザーの登録の有無
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id) #ログインユーザーの情報を取り出す
      @customer_card = customer.cards.retrieve(@card.card_id) #顧客情報からカードの情報を取り出す
      @exp_month = @customer_card.exp_month.to_s #有効期限（月）
      @exp_year = @customer_card.exp_year.to_s.slice(2,3) #有効期限（年）
    end
  end
  
  def destroy
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      if @card.destroy
        redirect_to root_path
      end
  end
end
