class AddCurrentinvestmentsumToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :current_investment_sum, :integer
  end
end
