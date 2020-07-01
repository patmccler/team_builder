class AddTeamSizeToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :team_size, :integer
  end
end
