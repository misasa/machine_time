class AddArchiverUrlToMachine < ActiveRecord::Migration
  def change
    add_column :machines, :archiver_url, :string
  end
end
