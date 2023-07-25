class JobsController < ApplicationController
  def index
    def index
      if params[:query].present?
        @jobs = @jobs.where("title ILIKE ?", "%#{params[:query]}%") # I stands for case insensitive
      else
        @jobs = Job.all
      end
    end
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
