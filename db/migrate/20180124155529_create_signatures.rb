class CreateSignatures < ActiveRecord::Migration[5.1]
  def change
    create_table :signatures do |t|
      t.string :uname
      t.references :dnanum, foreign_key: true

      t.timestamps
    end
  end
end
