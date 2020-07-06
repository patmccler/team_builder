desc "Fill in Roster unit type from current game"
task backfill_roster_unit_type: :environment do
  Roster.all.each do |r|
    r.unit_type = r.game.unit_type
    r.save
  end
end
