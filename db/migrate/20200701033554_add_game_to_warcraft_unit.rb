class AddGameToWarcraftUnit < ActiveRecord::Migration[6.0]
  def change
    add_column :warcraft_units, :game_id, :integer
  end
end
