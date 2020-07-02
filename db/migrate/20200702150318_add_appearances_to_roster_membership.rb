class AddAppearancesToRosterMembership < ActiveRecord::Migration[6.0]
  def change
    add_column :roster_memberships, :appearances, :integer, default: 0
  end
end
