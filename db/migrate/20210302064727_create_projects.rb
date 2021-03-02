class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :punchline
      t.text :description
      t.string :video
      t.string :image
      t.string :category
      t.integer :investment_goal
      t.date :investment_goal_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
