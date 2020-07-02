class WarcraftUnitsController < UnitsController
  UNIT_PATH_SYMBOL = :roster_warcraft_units_path
  UNIT_CLASS_NAME = WarcraftUnit

  def new
    @roles = WarcraftUnit::ROLE_VALUES
    super(UNIT_CLASS_NAME)
  end

  def create
    @roles = WarcraftUnit::ROLE_VALUES
    super(UNIT_CLASS_NAME, UNIT_PATH_SYMBOL)
  end

  def edit
    @roles = WarcraftUnit::ROLE_VALUES
  end

  def update
    @roles = WarcraftUnit::ROLE_VALUES
    super(UNIT_PATH_SYMBOL)
  end

private

  def unit_params
    # dont call super, instead define warcraft specific things here once implemented
    params.require(:warcraft_unit).permit(:name, :roster_ids, :buff, :role)
  end

  def find_unit
    super(UNIT_CLASS_NAME)
  end
end
