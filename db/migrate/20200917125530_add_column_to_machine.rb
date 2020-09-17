class AddColumnToMachine < ActiveRecord::Migration
  def change
    add_column :machines, :stage_name, :string
  end
end
