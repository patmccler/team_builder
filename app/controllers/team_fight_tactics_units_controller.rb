class TeamFightTacticsUnitsController < ApplicationController
  def index
    @roster = Roster.find_by(id: params[:roster_id])
    @units = @roster ? @roster.units : Unit.all
  end

  def new
    @unit = TeamFightTacticsUnit.new
    @roster = Roster.find_by(id: params[:roster_id])

  end

  def create
    unit = TeamFightTacticsUnit.new(team_fight_tactics_unit_params)
    unit.roster_memberships.build(roster: Roster.find(params[:roster_id])) if params[:roster_id]

    if unit.save
      redirect_to (params[:roster_id] ? roster_team_fight_tactics_units_path(unit.rosters.first) : unit)
    else
      @unit = unit
      @roster = params.find(:roster_id)
      redirect_to new
    end
  end

private

  def team_fight_tactics_unit_params
    params.require(:team_fight_tactics_unit).permit(:name, :roster_ids)
  end
end
