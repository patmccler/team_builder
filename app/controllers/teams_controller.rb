class TeamsController < ApplicationController
  before_action :set_team, only: [:show]
  def index
    # TODO: Show only logged in user unless they are admin, once users implemented
    @teams = Team.all
  end

  def show

  end

  def new
    @team = Team.new
    @rosters = Roster.all
  end

  def create
    team = Team.new(team_params)

    if team.save
      redirect_to team
    else
      @team = team
      @rosters = Roster.all
      render :new
    end
  end

private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :roster_id)
  end
end
