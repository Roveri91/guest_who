class Provider::JobsController < ApplicationController

  def index
    # @jobs = Job.where(user = current_user)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save!
      puts @job.error.messages
    end
    # @job.save!
    # redirect_to provider_jobs
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      redirect_to jobs_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:name, :price, :description, :location, :user_id, :photo)
  end

end
