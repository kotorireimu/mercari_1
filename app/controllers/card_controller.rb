class CardController < ApplicationController
  require "payjp"
  PAYJP_PRIVATE_KEY = 'sk_test_274c8b939aa04632fc0cb6dd'
  PAYJP_KEY = 'pk_test_1f1fa50fc2dbbb5dd592cbae'
  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def confirm
    
  end

  def pay 
    Payjp.api_key = 'sk_test_274c8b939aa04632fc0cb6dd'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      email: current_user.email, 
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "confirm"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete 
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = 'sk_test_274c8b939aa04632fc0cb6dd'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show 
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = 'sk_test_274c8b939aa04632fc0cb6dd'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
