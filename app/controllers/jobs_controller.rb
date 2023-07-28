require "open-uri"

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
  
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save!
      if !@job.photo.attached?
        file = URI.open("https://images.unsplash.com/photo-1456272875769-b47e860f93a4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=874&q=80")
        @job.photo.attach(io: file, filename: "jobphoto.jpg", content_type: "image/png")
      end  
      redirect_to provider_jobs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:name, :price, :description, :location, :user_id, :photo)
  end

end
