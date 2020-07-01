class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update]
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

  def edit
    @roster = @team.roster
  end

  def update
    @team.update(team_params)
    redirect_to @team
  end

private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :roster_id, team_memberships_attributes: [:id, :unit_id])
  end
end
