class Provider::JobsController < ApplicationController
    # layout "job"
  
    def index
      
    end
  
    def new
      @job = Job.new
    end
  
    # def create
    #   @job = Job.new(job_params)
    #   @job.user = current_user
    #   if @job.save!
    #     redirect_to provider_jobs_path
    #   else
    #     render :new, status: :unprocessable_entity
    #   end
    # end
  
    private
  
    def job_params
      params.require(:job).permit(:name, :price, :description, :location, :user_id, :photo)
    end
  
  end
  