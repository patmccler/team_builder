module RosterHelper
  def unit_path(roster, text = "See Units")
    if roster.game.unit_type == "WarcraftUnit"
      link_to text, roster_warcraft_units_path(@roster)
    elsif roster.game.unit_tupe == "TeamFightTacticsUnit"
      link_to text, roster_team_first_tactics_units_path(@roster)
    else
      "This roster doesn't have a recognizable unit type??"
    end
  end
end
