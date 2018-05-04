class AddBoardToSignatures < ActiveRecord::Migration[5.1]
  def change
    add_reference :signatures, :board, foreign_key: true
  end
end
