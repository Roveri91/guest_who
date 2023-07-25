class JobsController < ApplicationController
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

  def new

  end

  def create
  end

  private

  def job_params
    params.require(:job).permit(:name, :price, :description, :location, :user_id, :photo)
  end
end
