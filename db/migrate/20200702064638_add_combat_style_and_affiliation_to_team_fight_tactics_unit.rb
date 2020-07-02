class AddCombatStyleAndAffiliationToTeamFightTacticsUnit < ActiveRecord::Migration[6.0]
  def change
    add_column :team_fight_tactics_units, :combat_style, :string
    add_column :team_fight_tactics_units, :affiliation, :string
  end
end
