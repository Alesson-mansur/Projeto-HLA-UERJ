class CreateBoardnums < ActiveRecord::Migration[5.1]
  def change
    create_table :boardnums do |t|
      t.string :identification

      t.timestamps
    end
  end
end
