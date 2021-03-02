class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.string :title
      t.string :images
      t.text :content
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
