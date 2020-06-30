class WarcraftUnitsController < ApplicationController
  def index
    @roster = Roster.find_by(id: params[:roster_id])
    @units = @roster ? @roster.units : Unit.all
  end
end