class AddBoardnumToBoard < ActiveRecord::Migration[5.1]
  def change
    add_reference :boards, :boardnum, foreign_key: true
  end
end
