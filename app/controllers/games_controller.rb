class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @unit_types = Game::UNIT_TYPES
  end

  def create
    game = Game.new(game_params)

    if game.save
      redirect_to game_path(game)
    else
      @game = game
      render new
    end
  end

  def show
    @rosters = @game.rosters
  end

  def edit
    @unit_types = Game::UNIT_TYPES
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render(edit)
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :unit_type)
  end
end
