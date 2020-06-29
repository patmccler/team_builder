class CreateWarcraftUnit < ActiveRecord::Migration[6.0]
  def change
    create_table :warcraft_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
