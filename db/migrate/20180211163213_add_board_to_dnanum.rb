class AddBoardToDnanum < ActiveRecord::Migration[5.1]
  def change
    add_reference :dnanums, :board, foreign_key: true
  end
end
