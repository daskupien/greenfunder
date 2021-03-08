class MonetizeInvestmentAmount < ActiveRecord::Migration[6.0]
  def change
    add_monetize :investments, :investment_amount
  end
end
