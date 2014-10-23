class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :global_id
      t.integer :number
      t.string :name
      t.text :description
      t.datetime :started_at
      t.datetime :stopped_at
      t.integer :machine_id
      t.integer :user_id

      t.timestamps
    end
  end
end
