class HomeController < ApplicationController
  before_action :authenticate_user!

  def new_booking
    xapix = Adapter::Xapix.new()
    #works, awesome
    current_user.passenger_id = xapix.get_passengers_id(current_user)
    #doesn't work, hardcoded
    current_user.customer_address_id = xapix.get_customer_address_id(current_user)
    byebug
    booking_info = xapix.create_booking(current_user)
    byebug
  end

end
