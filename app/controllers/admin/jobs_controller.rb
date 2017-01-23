class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_admin_job, only: [:show, :edit, :update, :destroy]
  before_action :require_is_admin
  def show
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path, notice: "New job created successfully by admin."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "Job updated successfully by admin."
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, warning: "Job deleted successfully by admin."
  end
  
  private

  def set_admin_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
