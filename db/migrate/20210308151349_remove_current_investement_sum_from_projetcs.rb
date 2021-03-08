class RemoveCurrentInvestementSumFromProjetcs < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :current_investment_sum, :integer
  end
end
