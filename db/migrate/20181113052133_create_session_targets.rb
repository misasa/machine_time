class CreateSessionTargets < ActiveRecord::Migration
  def change
    create_table :session_targets do |t|
      t.references :session, index: true
      t.references :target, index: true
      t.timestamps
    end
  end
end
