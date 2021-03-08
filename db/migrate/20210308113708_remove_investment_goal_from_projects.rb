class RemoveInvestmentGoalFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :investment_goal, :integer
  end
end
