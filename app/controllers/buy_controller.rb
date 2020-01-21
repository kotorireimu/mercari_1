class BuyController < ApplicationController
  require 'payjp'

  def index
    @item = Item.find(params[:format]) #一覧から持ってこれないので持ってこれないので仮置き
    @user = User.find(current_user.id)
    card = Card.find_by(user_id: current_user.id)
    
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key =  'sk_test_274c8b939aa04632fc0cb6dd'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:format])
    @item.buyer_id = current_user.id
    @item.save
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key =  'sk_test_274c8b939aa04632fc0cb6dd'
    Payjp::Charge.create(
    :amount => @item.price, 
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end
end
