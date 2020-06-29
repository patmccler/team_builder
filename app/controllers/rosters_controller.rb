class RostersController < ApplicationController
  before_action :set_roster, only: [:show, :edit, :update,  :destroy]
  def new
    @roster = Roster.new(game: Game.find(params[:game_id]))
  end

  def create
    roster = Roster.new(roster_params)

    if roster.save
      redirect_to game_roster_path(roster.game, roster)
    else
      @roster = roster
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @roster.update(roster_params)
      redirect_to @roster
    else
      render :edit
    end
  end

  def destroy
    @roster.delete
    redirect_to @roster.game
  end

private

  def roster_params
    params.require(:roster).permit(:name, :description, :game_id)
  end

  def set_roster
    @roster = Roster.find(params[:id])
  end
end
