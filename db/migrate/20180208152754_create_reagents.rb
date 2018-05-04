class CreateReagents < ActiveRecord::Migration[5.1]
  def change
    create_table :reagents do |t|
      t.string :image
      t.string :amplific
      t.string :campo1
      t.string :campo2
      t.string :campo3
      t.string :campo4
      t.string :campo5
      t.string :campo6
      t.string :campo7
      t.string :campo8
      t.string :campo9
      t.string :campo10
      t.string :campo11
      t.string :campo12
      t.string :campo13
      t.string :campo14
      t.string :campo15
      t.string :campo16
      t.string :campo17
      t.string :campo18
      t.string :campo19
      t.string :campo20
      t.string :campo21
      t.string :campo22
      t.string :campo23
      t.string :campo24
      t.date :data1
      t.date :data2
      t.date :data3
      t.date :data4
      t.date :data5
      t.date :data6
      t.date :data7
      t.date :data8
      t.date :data9
      t.date :data12
      t.date :data13
      t.date :data14
      t.date :data15
      t.date :data16
      t.date :data17
      t.date :data18
      t.date :data19
      t.date :data20
      t.date :data23
      t.date :data24
      t.text :obs
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
