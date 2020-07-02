class AddChangeCountToTeamMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :team_memberships, :change_count, :integer, default: 0
  end
end
