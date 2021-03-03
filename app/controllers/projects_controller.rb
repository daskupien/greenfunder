class ProjectsController < ApplicationController
  def index
    if params[:query].present?
      @projects = Project.where("category ILIKE ?", "%#{params[:query]}%")
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
    @investment = Investment.new
    current_investment_sum = @project.current_investment_sum
    investment_goal = @project.investment_goal
    @investement_percentage = current_investment_sum.to_f / investment_goal * 100.0
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to user_path(current_user)
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :punchline,
      :description,
      :video,
      :image,
      :category,
      :investment_goal,
      :investment_goal_date
    )
  end
end

