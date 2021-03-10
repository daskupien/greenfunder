class InvestmentsController < ApplicationController
  def new
    @investment = Investment.new
    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @investment = Investment.new(investment_params)
    @project = Project.find(params[:project_id])

    # current_investment_sum_cents is calculated as callback in Investment

    @investment.user = current_user
    @investment.project = @project
    if @investment.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:comment, :investment_amount_cents)
  end
end
