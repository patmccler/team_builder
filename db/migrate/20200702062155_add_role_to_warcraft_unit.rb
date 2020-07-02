class AddRoleToWarcraftUnit < ActiveRecord::Migration[6.0]
  def change
    add_column :warcraft_units, :role, :string
  end
end
