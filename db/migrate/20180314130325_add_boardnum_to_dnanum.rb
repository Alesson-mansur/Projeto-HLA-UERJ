class AddBoardnumToDnanum < ActiveRecord::Migration[5.1]
  def change
    add_reference :dnanums, :boardnum, foreign_key: true
  end
end
