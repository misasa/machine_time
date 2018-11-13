class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :global_id, null:false, unique: true
      t.text :description
      t.timestamps
    end
  end
end
