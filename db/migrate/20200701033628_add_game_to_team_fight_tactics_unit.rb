class AddGameToTeamFightTacticsUnit < ActiveRecord::Migration[6.0]
  def change
    add_column :team_fight_tactics_units, :game_id, :integer
  end
end
