class ApiController < ApplicationController
  def all
    @creatures = Creature.all
    render :json => @creatures

  end

  def show
    @creature = Creature.find_by_id params[:id]
    render :json => @creature
  end

  def new
    @creature = Creature.new
  end

  def create
    creature = Creature.create creature_params
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :desciption, :location)
  end
end