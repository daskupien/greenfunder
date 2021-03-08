class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  monetize :investment_amount_cents
  after_create :update_project_sum

  private

  def update_project_sum
    @project = self.project

    new_investment_sum = investment_amount_cents + @project.current_investment_sum_cents.to_i
    @project.current_investment_sum_cents = new_investment_sum
    @project.save
  end
end
