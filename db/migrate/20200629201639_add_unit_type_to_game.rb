class AddUnitTypeToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :unit_type, :string
  end
end
