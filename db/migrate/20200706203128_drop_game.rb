class DropGame < ActiveRecord::Migration[6.0]
  def up
    drop_table :games
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
