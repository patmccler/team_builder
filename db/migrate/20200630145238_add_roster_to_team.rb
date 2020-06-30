class AddRosterToTeam < ActiveRecord::Migration[6.0]
  def change
    add_reference :teams, :roster, null: false, foreign_key: true
  end
end
