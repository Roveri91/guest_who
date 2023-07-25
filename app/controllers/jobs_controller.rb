class JobsController < ApplicationController
  # layout "job"

  def index
    @jobs = Job.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR location ILIKE :query OR description ILIKE :query"
      @jobs = @jobs.where(sql_subquery, query: "%#{params[:query]}%") # I stands for case insensitive
    end
  end

  def show
    @job = Job.find(params[:id])
    @booking = Booking.new
  end

end
