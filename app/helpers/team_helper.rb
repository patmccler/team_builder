module TeamHelper
  def show_unselected(team)
    unselected_count = team.units.count(&:nil?)
    "#{pluralize(unselected_count, 'Unit')} Unselected" if unselected_count.positive?
  end

  def render_team_info(team)
    if team.roster.unit_type == "WarcraftUnit"
      render_wow_team_info(team)
    elsif team.roster.unit_type == "TeamFightTacticsUnit"
      render_tft_team_info(team)
    end
  end

  def render_wow_team_info(team)
    all_buffs = team.roster.units.map(&:buff).reject(&:blank?).uniq
    members = team.units.reject(&:blank?)
    team_buffs = members.map(&:buff).reject(&:blank?).uniq

    locals = {
      team_buffs: team_buffs,
      missing_buffs: all_buffs - team_buffs,
      roles: members.group_by(&:role),
    }
    render partial: "warcraft_units/team_info", locals: locals
  end

  def render_tft_team_info(team)
    # duplicate members dont add to count
    members = team.units.reject(&:blank?).uniq
    locals = {
      affiliations: members.group_by(&:affiliation),
      combat_styles: members.group_by(&:combat_style),
    }

    render partial: "team_fight_tactics_units/team_info", locals: locals
  end
end
