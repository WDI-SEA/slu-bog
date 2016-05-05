class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def create
    creature = Creature.create creature_params
    redirect_to creature_path creature
  end

  def new
    @creature = Creature.new
  end

  def edit
    @creature = Creature.find params[:id]
  end

  def show
    @creature = Creature.find params[:id]
  end

  def update
    c = Creature.find params[:id]
    c.update creature_params
    redirect_to creatures_path
  end

  def destroy
    Creature.find(params[:id]).delete
    redirect_to creatures_path
  end

  private

  def creature_params
    params.require(:creature).permit(:species, :location, :description)
  end
end
