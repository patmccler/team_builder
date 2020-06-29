class CreateRosters < ActiveRecord::Migration[6.0]
  def change
    create_table :rosters do |t|
      t.string :name
      t.string :description
      t.references :game

      t.timestamps
    end
  end
end
