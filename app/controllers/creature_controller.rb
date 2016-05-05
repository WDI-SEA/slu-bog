class CreatureController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
  end

  def create
    creature = Creature.create creature_params
    redirect_to creatures_path
  end

  def show
    @creature = Creature.find params[:id]
  end

  def edit
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

  def creature_params
    params.require(:creature).permit(:name, :description)
end
