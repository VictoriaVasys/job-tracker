class JobsController < ApplicationController  
  before_action :set_company, only: [:index, :new, :edit, :create, :update, :destroy]
    
  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = @company.jobs.find(params[:id])
  end

  def update
    @job = @company.jobs.find(params[:id])
    if @job.update(job_params) #.merge(category: @category))
      flash[:success] = "#{@job.title} was added!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job = @company.jobs.find(params[:id])
    @job.destroy
    flash[:success] = "#{@job.title} was  deleted!"
    redirect_to company_jobs_path(@company)
  end

  private
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  # def set_category
  #   @category = Category.find(params[:category_id])
  # end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
