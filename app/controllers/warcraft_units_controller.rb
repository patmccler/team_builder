class WarcraftUnitsController < ApplicationController
  def index
    @roster = Roster.find_by(id: params[:roster_id])
    @units = @roster ? @roster.units : Unit.all
  end

  def new
    @unit = WarcraftUnit.new
    @roster = Roster.find_by(id: params[:roster_id])

  end

  def create
    @unit = WarcraftUnit.new(warcraft_unit_params)
    @roster = Roster.find(params[:roster_id])
    @unit.roster_memberships.build(roster: @roster) if @roster
    @unit.game = @roster.game

    if @unit.save
      redirect_to @roster || @unit
    else
      render :new
    end
  end



private

  def warcraft_unit_params
    params.require(:warcraft_unit).permit(:name, :roster_ids)
  end
end
