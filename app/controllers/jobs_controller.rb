class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @booking = Booking.new
  end

  def new

  end

  def create
    
  end

  private
  
  def job_params
    params.require(:job).permit(:name, :price, :description, :location, :user_id)
  end
end
