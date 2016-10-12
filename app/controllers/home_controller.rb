class HomeController < ApplicationController
  before_action :authenticate_user!

  def new_booking
    xapix = Adapter::Xapix.new
    booking_info = xapix.create_booking(current_user)
    byebug
  end

end
