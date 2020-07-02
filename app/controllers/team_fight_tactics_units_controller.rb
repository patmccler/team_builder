class TeamFightTacticsUnitsController < UnitsController
  UNIT_PATH_SYMBOL = :roster_team_fight_tactics_units_path
  UNIT_CLASS_NAME = TeamFightTacticsUnit

  def new
    super(UNIT_CLASS_NAME)
  end

  def create
    super(UNIT_CLASS_NAME, UNIT_PATH_SYMBOL)
  end

  def update
    super(UNIT_PATH_SYMBOL)
  end

private

  def unit_params
    # dont call super, instead define tft specific things here once implemented
    super(:team_fight_tactics_unit)
  end

  def find_unit
    super(UNIT_CLASS_NAME)
  end
end
