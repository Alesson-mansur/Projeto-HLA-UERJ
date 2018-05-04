class CreatePhases < ActiveRecord::Migration[5.1]
  def change
    create_table :phases do |t|
      t.string :pcr
      t.string :electro
      t.string :hibrid
      t.string :interp
      t.string :relat
      t.string :base
      t.string :negativo
      t.string :positivo
      t.text :opt1
      t.text :opt2
      t.date :data1
      t.date :data2
      t.date :data3
      t.date :data4
      t.date :data5
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
