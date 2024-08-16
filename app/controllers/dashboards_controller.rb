class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @offers = current_user.offers
    @bookings = current_user.offers_bookings

    @markers = @bookings.geocoded.map do |booking|
      {
        lat: booking.latitude,
        lng: booking.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {booking: booking }),
      }
    end
  end
end
