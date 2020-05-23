class BuysController < ApplicationController
  require 'payjp'
  before_action :check
  before_action :set_card
  
  def check
    if user_signed_in?
      set_card
    else
      redirect_to new_user_session_path
    end
  end

  def show
    set_item
    @items = Item.includes(:images).order('created_at DESC')
  end

  def pay
    @item = Item.find(params[:item_id])
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
      amount: @item.price_id, #支払金額
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    @item.buyer_id = current_user.id
    @item.save
    redirect_to root_path
  end

  private

  def set_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
