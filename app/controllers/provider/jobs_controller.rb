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
    @job.save
    redirect_to bookings_path
  end

  private

  def job_params
    params.require(:job).permit(:name, :price, :description, :location, :user_id)
  end

end
