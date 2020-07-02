class AddBuffToWarcraftUnit < ActiveRecord::Migration[6.0]
  def change
    add_column :warcraft_units, :buff, :string
  end
end
