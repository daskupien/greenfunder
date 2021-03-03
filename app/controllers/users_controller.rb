class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @investments = Investment.where(user: current_user)
    @investments.each do |investment|
      current_investment_sum = investment.project.current_investment_sum
      investment_goal = investment.project.investment_goal
      @investment_percentage = current_investment_sum.to_f / investment_goal * 100.0
      investment.investment_percentage = @investment_percentage
    end
  end
end
