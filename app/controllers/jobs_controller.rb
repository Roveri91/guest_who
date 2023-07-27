class JobsController < ApplicationController
  # layout "job"

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

end
