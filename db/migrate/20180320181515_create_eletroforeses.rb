class CreateEletroforeses < ActiveRecord::Migration[5.1]
  def change
    create_table :eletroforeses do |t|
      t.string :who
      t.date :when
      t.references :board, foreign_key: true
      t.references :phase, foreign_key: true

      t.timestamps
    end
  end
end
