class CreateDnanums < ActiveRecord::Migration[5.1]
  def change
    create_table :dnanums do |t|
      t.string :code
      t.string :option

      t.timestamps
    end
  end
end
