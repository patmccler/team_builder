module TeamHelper
  def show_unselected(team)
    unselected_count = team.units.count(&:nil?)
    "#{pluralize(unselected_count, 'Unit')} Unselected" if unselected_count.positive?
  end

  def render_team_info(team)
    render_wow_team_info(team) if team.roster.unit_type == "WarcraftUnit"
    render_tft_team_info(team) if team.roster.unit_type == "TeamFightTacticsUnit"
  end

  def render_wow_team_info(team)
    all_buffs = team.roster.units.map(&:buff).reject(&:blank?).uniq
    team_buffs = team.units.map(&:buff).reject(&:blank?).uniq

    locals = {
      team_buffs: team_buffs,
      missing_buffs: all_buffs - team_buffs,
      roles: team.units.group_by(&:role),
    }
    render partial: "warcraft_units/team_info", locals: locals
  end

  def render_tft_team_info(team)
    locals = {
      affiliations: team.units.group_by(&:affiliation),
      combat_styles: team.units.group_by(&:combat_style),
    }

    render partial: "team_fight_tactics_units/team_info", locals: locals
  end
end
