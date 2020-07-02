module TeamHelper
  def show_unselected(team)
    unselected_count = team.units.count(&:nil?)
    "#{pluralize(unselected_count, 'Unit')} Unselected" if unselected_count.positive?
  end

  def render_team_info(team)
    render_wow_buff_info(team) if team.roster.unit_type == "WarcraftUnit"
  end

  def render_wow_buff_info(team)
    team_buffs = team.units.map(&:buff).reject(&:blank?).uniq
    all_buffs = team.roster.units.map(&:buff).reject(&:blank?).uniq
    roles = team.units.group_by(&:role)
    missing_buffs = all_buffs - team_buffs
    render partial: "warcraft_units/team_info", locals: { team_buffs: team_buffs,
                                                          missing_buffs: missing_buffs, roles: roles }
  end
end
