class MonetizeProjectsGoal < ActiveRecord::Migration[6.0]
  def change
    add_monetize :projects, :investment_goal
  end
end
