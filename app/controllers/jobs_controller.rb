class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @q = Job.published.ransack(params[:q])
    @jobs = @q.result
    #
    # @jobs = case params[:order]
    #         when 'by_lower_bound'
    #           Job.published.order('wage_lower_bound DESC')
    #         when 'by_upper_bound'
    #           Job.published.order('wage_upper_bound DESC')
    #         when 'by_company'
    #           Job.published.order('company ASC')
    #         when 'by_location'
    #           Job.published.order('location ASC')
    #         when 'by_category'
    #           Job.published.order('category ASC')
    #         when 'by_title'
    #           Job.published.order('LOWER(title) ASC')
    #         else
    #           Job.published.recent
    # end
    @jobs = @jobs.paginate(page: params[:page], per_page: 5)
  end

  def show
    if @job.is_hidden
      flash[:warning] = 'Job not available.'
      redirect_to :back
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: 'Job was successfully destroied.'
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :company, :location, :category, :contact_email, :is_hidden)
  end
end
