class RemoveGameFromTeamFightTacticsUnit < ActiveRecord::Migration[6.0]
  def change
    remove_column :team_fight_tactics_units, :game_id, :integer
  end
end
