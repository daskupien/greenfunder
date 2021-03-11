class ProjectsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      sql_query = "category ILIKE :query OR address ILIKE :query"
      @projects = Project.where(sql_query, query: "%#{params[:query]}%")
    else
      @projects = Project.all
      @projects = @projects.sort_by(&:id)
    end

    @markers = @projects.geocoded.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { project: project}),
        image_url:
        if project.category.downcase == 'planting'
        helpers.asset_url('https://res.cloudinary.com/rentmylife/image/upload/v1615300113/assets/seedling-solid_qrct50.svg')
        elsif project.category.downcase == 'energy'
         helpers.asset_url('https://res.cloudinary.com/rentmylife/image/upload/v1615300158/assets/solar-panel-solid_qifuhb.svg')
        elsif project.category.downcase == 'animals'
          helpers.asset_url('https://res.cloudinary.com/rentmylife/image/upload/v1615300194/assets/forumbee-brands_tdqp7f.svg')
        elsif project.category.downcase == 'plastic alternatives'
          helpers.asset_url('https://res.cloudinary.com/rentmylife/image/upload/v1615300227/assets/box-open-solid_hh8yu2.svg')
        end
      }
    end
  end

  def show
    @project = Project.find(params[:id])
    @investment = Investment.new
    current_investment_sum = @project.current_investment_sum_cents
    investment_goal = @project.investment_goal_cents
    @investement_percentage = current_investment_sum.to_f / investment_goal * 100.0

    respond_to do |format|
      format.html
      format.js
    end
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
      :address,
      :punchline,
      :description,
      :video,
      :image,
      :category,
      :investment_goal_cents,
      :investment_goal_date
    )
  end
end

