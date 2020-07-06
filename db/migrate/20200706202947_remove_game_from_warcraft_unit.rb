class RemoveGameFromWarcraftUnit < ActiveRecord::Migration[6.0]
  def change
    remove_column :warcraft_units, :game_id, :integer
  end
end
