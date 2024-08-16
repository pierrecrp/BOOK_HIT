class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @offers = current_user.offers
    @bookings = current_user.offers_bookings

    @markers = @bookings.geocoded.map do |booking|
      {
        lat: booking.latitude,
        lng: booking.longitude
      }
    end
  end
end
