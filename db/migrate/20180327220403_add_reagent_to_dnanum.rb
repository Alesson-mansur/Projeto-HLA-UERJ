class AddReagentToDnanum < ActiveRecord::Migration[5.1]
  def change
    add_reference :dnanums, :reagent, foreign_key: false
  end
end
