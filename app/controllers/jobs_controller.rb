class JobsController < ApplicationController
  # layout "job"

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @booking = Booking.new
  end

end
