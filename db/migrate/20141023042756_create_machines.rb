class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.text :description
      t.string :state
      t.string :session_prefix      
      t.timestamps
    end
  end
end
