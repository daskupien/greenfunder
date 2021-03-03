class InvestmentsController < ApplicationController
  def new
    @investment = Investment.new
    @project = Project.find(params[:project_id])
  end

  def create
    @investment = Investment.new(investment_params)
    @project = Project.find(params[:project_id])
    new_investment_sum = @investment.investment_amount + @project.current_investment_sum
    @project.current_investment_sum = new_investment_sum
    @project.save
    @investment.user = current_user
    @investment.project = @project
    if @investment.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:comment, :investment_amount)
  end
end
