module RosterHelper
  def unit_path(roster, text = "See Units")
    if roster.unit_type == "WarcraftUnit"
      link_to text, roster_warcraft_units_path(@roster)
    elsif roster.unit_type == "TeamFightTacticsUnit"
      link_to text, roster_team_fight_tactics_units_path(@roster)
    else
      "This roster doesn't have a recognizable unit type??"
    end
  end

  def unit_type_radio_button_with_label(form, unit_type)
    if form.object.persisted?
      if form.object.unit_type == unit_type
        form.radio_button(:unit_type, unit_type, checked: true) +
          form.label(:unit_type, unit_type.titleize)
      end
    else
      form.radio_button(:unit_type, unit_type) +
        form.label(:unit_type, unit_type.titleize)
    end
  end
end
