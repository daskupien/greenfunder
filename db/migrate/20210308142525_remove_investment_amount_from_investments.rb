class RemoveInvestmentAmountFromInvestments < ActiveRecord::Migration[6.0]
  def change
    remove_column :investments, :investment_amount, :integer
  end
end
