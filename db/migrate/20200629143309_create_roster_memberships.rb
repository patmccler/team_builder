class CreateRosterMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :roster_memberships do |t|
      t.integer :roster_id
      t.integer :unit_id
      t.string :unit_type

      t.timestamps
    end
  end
end
