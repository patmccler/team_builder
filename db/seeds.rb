# creating some basic data for the app
User.create(username: "admin", password: "admin", admin: true)
User.create(username: "pat", password: "password")

tank = WarcraftUnit::ROLE_VALUES[0]
dps = WarcraftUnit::ROLE_VALUES[1]
healer = WarcraftUnit::ROLE_VALUES[2]

Roster.destroy_all
Team.destroy_all
WarcraftUnit.destroy_all
TeamFightTacticsUnit.destroy_all

wow_roster = Roster.create(
  { name: "Classic WoW", description: "Patch 1.0", unit_type: Roster::UNIT_TYPES[0] }
)

_tft_roster = Roster.create(
  { name: "3.5 Galaxies", description: "TFT Current live patch", unit_type: Roster::UNIT_TYPES[1] }
)

wow_roster.roster_memberships.build(
  [
    { unit: WarcraftUnit.create(name: "Protection Warrior", role: tank, buff: "Battle Shout") },
    { unit: WarcraftUnit.create(name: "Arms Warrior", role: dps, buff: "Battle Shout") },
    { unit: WarcraftUnit.create(name: "Fury Warrior", role: dps, buff: "Battle Shout") },
    { unit: WarcraftUnit.create(name: "Holy Priest", role: healer, buff: "Power Word: Fortitude") },
    { unit: WarcraftUnit.create(name: "Discipline Priest", role: healer, buff: "Power Word: Fortitude") },
    { unit: WarcraftUnit.create(name: "Shadow Priest", role: dps, buff: "Power Word: Fortitude") },
    { unit: WarcraftUnit.create(name: "Marksman Hunter", role: dps, buff: "Trueshot Aura") },
    { unit: WarcraftUnit.create(name: "Survival Hunter", role: dps) },
    { unit: WarcraftUnit.create(name: "Beastmaster Hunter", role: dps) },
    { unit: WarcraftUnit.create(name: "Restoration Druid", role: healer, buff: "Mark of the Wild") },
    { unit: WarcraftUnit.create(name: "Balance Druid", role: dps, buff: "Moonkin Aura") },
    { unit: WarcraftUnit.create(name: "Feral Druid (cat)", role: dps, buff: "Leader of the Pack") },
    { unit: WarcraftUnit.create(name: "Feral Druid (bear)", role: tank, buff: "Leader of the Pack") },
    { unit: WarcraftUnit.create(name: "Fire Mage", role: dps, buff: "Arcane Intellect") },
    { unit: WarcraftUnit.create(name: "Frost Mage", role: dps, buff: "Arcane Intellect") },
    { unit: WarcraftUnit.create(name: "Arcane Mage", role: dps, buff: "Arcane Intellect") },
    { unit: WarcraftUnit.create(name: "Holy Paladin", role: healer, buff: "Blessing of Kings") },
    { unit: WarcraftUnit.create(name: "Retribution Paladin", role: dps, buff: "Blessing of Might") },
    { unit: WarcraftUnit.create(name: "Protection Paladin", role: tank, buff: "Blessing of Sanctuary") },
    { unit: WarcraftUnit.create(name: "Combat Rogue", role: dps) },
    { unit: WarcraftUnit.create(name: "Assassination Rogue", role: dps) },
    { unit: WarcraftUnit.create(name: "Subtlety Rogue", role: dps, buff: "Hemorrhage (debuff)") },
    { unit: WarcraftUnit.create(name: "Elemental Shaman", role: dps, buff: "Totems (various)") },
    { unit: WarcraftUnit.create(name: "Enhancement Shaman", role: dps, buff: "Windfury Totem") },
    { unit: WarcraftUnit.create(name: "Restoration Shaman", role: healer, buff: "Healing Stream Totem") },
    { unit: WarcraftUnit.create(name: "Destruction Warlock", role: dps, buff: "Healthstones") },
    { unit: WarcraftUnit.create(name: "Affliction Warlock", role: dps, buff: "Curse of Weakness") },
    { unit: WarcraftUnit.create(name: "Demonology Warlock", role: dps, buff: "Curse of Shadow") },
  ]
)

wow_roster.save
