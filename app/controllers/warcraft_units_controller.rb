class WarcraftUnitsController < ApplicationController
  before_action :set_unit, only: [:edit, :update]
  before_action :require_admin

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
      redirect_to roster_warcraft_units_path(@roster) || @unit
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @unit.update(warcraft_unit_params)
      redirect_to roster_warcraft_units_path(@unit.rosters.last)
    else
      render :edit
    end
  end

private

  def warcraft_unit_params
    params.require(:warcraft_unit).permit(:name, :roster_ids)
  end

  def set_unit
    @unit = WarcraftUnit.find(params[:id])
  end
end
