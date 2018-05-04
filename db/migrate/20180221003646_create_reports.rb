class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.text :detail
      t.references :board, foreign_key: true
      t.references :phase, foreign_key: true
      t.references :reagent, foreign_key: true

      t.timestamps
    end
  end
end
