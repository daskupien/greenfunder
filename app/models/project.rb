class Project < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :investments, dependent: :destroy
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :search_by_address_and_category,
    against: [ :address, :category ],
    using: {
      tsearch: { prefix: true }
    }

  monetize :investment_goal_cents, :current_investment_sum_cents

  # def calculate_current_investment

  # end
end
# random comment can be deleted
