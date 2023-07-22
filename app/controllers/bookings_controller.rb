class BookingsController < ApplicationController
  before_action :set_job, only: [:create]

  def index
    @bookings = current_user.bookings
  end

  # def new
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.job_id = @job.id # booking's job id is equal to the job id
    @booking.user = current_user
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
