class Provider::JobsController < ApplicationController

  def index
    @jobs = current_user.jobs
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save!
      puts @job.error.messages
    end
    # @job.save!
    # redirect_to provider_jobs
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
