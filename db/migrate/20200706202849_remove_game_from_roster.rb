class RemoveGameFromRoster < ActiveRecord::Migration[6.0]
  def change
    remove_column :rosters, :game_id, :integer
  end
end
