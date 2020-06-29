class CreateTeamMembership < ActiveRecord::Migration[6.0]
  def change
    create_table :team_memberships do |t|
      t.integer :team_id
      t.integer :unit_id
      t.string :unit_type

      t.timestamps
    end
  end
end
