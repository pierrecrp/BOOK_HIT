class DashboardsController < ApplicationController
  def index
    @offers = current_user.offers
    @bookings = current_user.offers_bookings
  end
end
