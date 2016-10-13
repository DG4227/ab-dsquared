class BookingsController < ApplicationController
  before_action :authenticate_user!


def create
  xapix = Adapter::Xapix.new
  byebug
  xapix.create_booking(current_user)
end


def new

  xapix = Adapter::Xapix.new
  #works, awesome
  current_user.passenger_id = xapix.get_passengers_id(current_user)
  #doesn't work, hardcoded
  current_user.customer_address_id = xapix.get_customer_address_id(current_user)
  #booking_info = xapix.create_booking(current_user)
end

end
