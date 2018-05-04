class AddExamToDnanum < ActiveRecord::Migration[5.1]
  def change
    add_reference :dnanums, :exam, foreign_key: true
  end
end
