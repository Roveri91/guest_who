class Provider::BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings_as_provider
    @user = current_user
  end

  def update
    raise
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      redirect_to jobs_path
    end
  end

  private

  def booking_params
    params.require(:job).permit(:status, :user_id)
  end

end
