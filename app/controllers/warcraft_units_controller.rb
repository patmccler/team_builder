class WarcraftUnitsController < ApplicationController
  def index
    @roster = Roster.find_by(id: params[:roster_id])
    @units = @roster ? @roster.units : Unit.all
  end

  def new
    @unit = WarcraftUnit.new
    @roster_id = params[:roster_id]
  end
end