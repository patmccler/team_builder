class WarcraftUnitsController < UnitsController
  UNIT_PATH_SYMBOL = :roster_warcraft_units_path
  UNIT_CLASS_NAME = WarcraftUnit

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
    # dont call super, instead define warcraft specific things here once implemented
    params.require(:warcraft_unit).permit(:name, :roster_ids, :buff)
  end

  def find_unit
    super(UNIT_CLASS_NAME)
  end
end
