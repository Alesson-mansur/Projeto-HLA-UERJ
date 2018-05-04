class AddWellToDnanum < ActiveRecord::Migration[5.1]
  def change
    add_column :dnanums, :well, :string
  end
end
