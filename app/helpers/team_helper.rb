module TeamHelper
  def show_unselected(team)
    unselected_count = team.units.count(&:nil?)
    "#{pluralize(unselected_count, 'Unit')} Unselected" if unselected_count.positive?
  end
end
