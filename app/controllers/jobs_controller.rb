class JobsController < ApplicationController
  def index
    @jobs = Job.all
      if params[:query].present?
        @jobs = Job.search_by_name_and_location_and_description_and_price(params[:query])
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
    params.require(:job).permit(:name, :price, :description, :location, :user_id, :photo)
  end
end
