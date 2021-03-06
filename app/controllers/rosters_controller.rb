class RostersController < ApplicationController
  before_action :set_roster, only: %i[show edit update destroy copy clone]
  before_action :require_admin

  def index
    @rosters = Roster.all
  end

  def new
    @roster = Roster.new
    @unit_types = Roster::UNIT_TYPES
  end

  def create
    roster = Roster.new(roster_params)

    if roster.save
      redirect_to roster
    else
      @roster = roster
      @unit_types = Roster::UNIT_TYPES
      render :new
    end
  end

  def show; end

  def edit
    @unit_types = Roster::UNIT_TYPES
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
    redirect_to rosters_path
  end

  def copy; end

  def clone
    new_roster = Roster.new(roster_params)
    if new_roster.save
      # binding.pry
      new_roster.add_units(@roster.units)

      redirect_to new_roster
    else
      @roster = new_roster
      render :copy
    end
  end

private

  def roster_params
    params.require(:roster).permit(:name, :description, :unit_type )
  end

  def set_roster
    @roster = Roster.find(params[:id])
  end
end
