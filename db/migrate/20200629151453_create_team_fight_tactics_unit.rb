class CreateTeamFightTacticsUnit < ActiveRecord::Migration[6.0]
  def change
    create_table :team_fight_tactics_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
