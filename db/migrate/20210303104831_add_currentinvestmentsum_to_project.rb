class AddCurrentinvestmentsumToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :current_investement_sum, :integer
  end
end
