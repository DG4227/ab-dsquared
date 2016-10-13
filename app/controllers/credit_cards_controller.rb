class CreditCardsController < ApplicationController

  def create
    card = CreditCard.new(credit_card_params)
    card.user_id = current_user.id
    card.save
    xapix = Adapter::Xapix.new
    current_user.cc_id = xapix.get_credit_card_id(card)
    #current_booking = Booking.all.find_by id: current_user.current_booking_id
    #current_booking.credit_card_id = current_user.cc_id
    render "home/index"
  end

  def new
  end

  def show
  end

  def index
  end

  def updated
  end

  def edit
  end

  private
  def credit_card_params
    params.require("credit_card").permit(:holders_name, :card_type, :cvc, :number, :expiry_date)
  end
end
