# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tank = WarcraftUnit::ROLE_VALUES[0]
dps = WarcraftUnit::ROLE_VALUES[1]
healer = WarcraftUnit::ROLE_VALUES[2]


Game.all.destroy_all

#Create Games
wow = Game.create(name: "World of Warcraft", unit_type: Game::UNIT_TYPES[0])
tft = Game.create(name: "Team Fight Tactics", unit_type: Game::UNIT_TYPES[1])

wow_roster = wow.rosters.build(
  { name: "Classic WoW", description: "Patch 1.0"}
)
wow_roster.save

wow_roster.roster_memberships.build(
  [
    { unit: WarcraftUnit.create(game: wow, name: "Protection Warrior", role: tank, buff: "Battle Shout") },
    { unit: WarcraftUnit.create(game: wow, name: "Arms Warrior", role: dps, buff: "Battle Shout") },
    { unit: WarcraftUnit.create(game: wow, name: "Fury Warrior", role: dps, buff: "Battle Shout") },
    { unit: WarcraftUnit.create(game: wow, name: "Holy Priest", role: healer, buff: "Power Word: Fortitude") },
    { unit: WarcraftUnit.create(game: wow, name: "Discipline Priest", role: healer, buff: "Power Word: Fortitude") },
    { unit: WarcraftUnit.create(game: wow, name: "Shadow Priest", role: dps, buff: "Power Word: Fortitude") },
    { unit: WarcraftUnit.create(game: wow, name: "Marksman Hunter", role: dps, buff: "Trueshot Aura") },
    { unit: WarcraftUnit.create(game: wow, name: "Survival Hunter", role: dps) },
    { unit: WarcraftUnit.create(game: wow, name: "Beastmaster Hunter", role: dps) },
    { unit: WarcraftUnit.create(game: wow, name: "Restoration Druid", role: healer, buff: "Mark of the Wild") },
    { unit: WarcraftUnit.create(game: wow, name: "Balance Druid", role: dps, buff: "Moonkin Aura") },
    { unit: WarcraftUnit.create(game: wow, name: "Feral Druid (cat)", role: dps, buff: "Leader of the Pack") },
    { unit: WarcraftUnit.create(game: wow, name: "Feral Druid (bear)", role: tank, buff: "Leader of the Pack") },
    { unit: WarcraftUnit.create(game: wow, name: "Fire Mage", role: dps, buff: "Arcane Intellect") },
    { unit: WarcraftUnit.create(game: wow, name: "Frost Mage", role: dps, buff: "Arcane Intellect") },
    { unit: WarcraftUnit.create(game: wow, name: "Arcane Mage", role: dps, buff: "Arcane Intellect") },
    { unit: WarcraftUnit.create(game: wow, name: "Holy Paladin", role: healer, buff: "Blessing of Kings") },
    { unit: WarcraftUnit.create(game: wow, name: "Retribution Paladin", role: dps, buff: "Blessing of Might") },
    { unit: WarcraftUnit.create(game: wow, name: "Protection Paladin", role: tank, buff: "Blessing of Sanctuary") },
    { unit: WarcraftUnit.create(game: wow, name: "Combat Rogue", role: dps) },
    { unit: WarcraftUnit.create(game: wow, name: "Assassination Rogue", role: dps) },
    { unit: WarcraftUnit.create(game: wow, name: "Subtlety Rogue", role: dps, buff: "Hemorrhage (debuff)") },
    { unit: WarcraftUnit.create(game: wow, name: "Elemental Shaman", role: dps, buff: "Totems (various)") },
    { unit: WarcraftUnit.create(game: wow, name: "Enhancement Shaman", role: dps, buff: "Windfury Totem") },
    { unit: WarcraftUnit.create(game: wow, name: "Restoration Shaman", role: healer, buff: "Healing Stream Totem") },
    { unit: WarcraftUnit.create(game: wow, name: "Destruction Warlock", role: dps, buff: "Healthstones") },
    { unit: WarcraftUnit.create(game: wow, name: "Affliction Warlock", role: dps, buff: "Curse of Weakness") },
    { unit: WarcraftUnit.create(game: wow, name: "Demonology Warlock", role: dps, buff: "Curse of Shadow") },
  ]
)

wow_roster.save
