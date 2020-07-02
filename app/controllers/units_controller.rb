class UnitsController < ApplicationController
  before_action :find_unit, only: %i[edit update]
  before_action :require_admin

  def index
    @roster = Roster.find_by(id: params[:roster_id])
    @units = @roster ? @roster.units : Unit.all
  end

  def new(unit_class)
    @unit = unit_class.new
    @roster = Roster.find_by(id: params[:roster_id])
  end

  def create(unit_class, roster_path)
    @unit = unit_class.new(unit_params)
    @roster = Roster.find(params[:roster_id])
    @unit.roster_memberships.build(roster: @roster)
    @unit.game = @roster.game

    if @unit.save
      redirect_to send(roster_path, @unit.rosters.last)
    else
      render :new
    end
  end

  def edit; end

  def update(roster_path)
    if @unit.update(unit_params)
      redirect_to send(roster_path, @unit.rosters.last)
    else
      render :edit
    end
  end

private

  def unit_params(unit_symbol)
    params.require(unit_symbol).permit(:name, :roster_ids)
  end

  def find_unit(unit_class)
    @unit = unit_class.find(params[:id])
  end
end
