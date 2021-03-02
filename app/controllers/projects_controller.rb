class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
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
