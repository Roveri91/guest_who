class Provider::BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings_as_provider
    @user = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(status: 'accepted')
      redirect_to bookings_path
    else
      redirect_to jobs_path
      # status: 'rejected'
    end
  end

  private

  def booking_params
    params.require(:job).permit(:status, :user_id)
  end
end
