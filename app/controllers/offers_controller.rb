class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  
  before_action :set_offer, only: [:show]
  def index
    @offers = Offer.all
  end
  def show
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :speciality, :price, :user_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
