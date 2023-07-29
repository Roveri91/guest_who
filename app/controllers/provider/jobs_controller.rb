class Provider::JobsController < ApplicationController

  def index
    @jobs = current_user.jobs
  end

  def new
    @job = Job.new
  end
  
  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      redirect_to jobs_path
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to provider_jobs_path, status: :see_other
  end

  private

  def job_params
    params.require(:job).permit(:name, :price, :description, :location, :user_id, :photo)
  end

end
