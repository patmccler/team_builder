class AddUnitTypeToRoster < ActiveRecord::Migration[6.0]
  def change
    add_column :rosters, :unit_type, :string
  end
end
