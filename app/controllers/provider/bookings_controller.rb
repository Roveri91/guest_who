class Provider::BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings_as_provider
    @user = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    if params[:booking][:status] == 'accepted' && @booking.update(status: 1)
      redirect_to provider_bookings_path
    elsif params[:booking][:status] == 'rejected' && @booking.update(status: 2)
      # @booking.update(status: 2)
      redirect_to provider_bookings_path
    end
  end

  private

  def booking_params
    params.require(:job).permit(:status, :user_id)
  end
end
