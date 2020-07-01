class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]
  def index
    @teams = Team.all if helpers.admin?
    @user_teams = helpers.current_user.teams
  end

  def show; end

  def new
    @team = Team.new
    @rosters = Roster.all
  end

  def create
    team = Team.new(team_params)
    team.user = helpers.current_user

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

  def destroy
    @team.destroy
    redirect_to teams_path
  end

private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :roster_id, :team_size, team_memberships_attributes: %i[id unit_id])
  end
end
