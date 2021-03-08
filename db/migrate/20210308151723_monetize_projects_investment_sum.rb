class MonetizeProjectsInvestmentSum < ActiveRecord::Migration[6.0]
  def change
    add_monetize :projects, :current_investment_sum
  end
end
