class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def new
    @creature =Creature.new

  end

  def create
    @creature = Creature.create params[:username,:creature]
    redirect_to creature_path creature
  end

  def show
    @creature = Creature.find params[:id]
  end

  def update
    @creature = Creature.find params[:id]
    @creature.update creature_params
    redirect_to creatures_path
  end

  def edit
    @creature = Creature.find params[:id]
  end

  def destroy
    Creature.find(params[:id]).delete
    redirect_to creatures_path
  end

  # def creature_params
  #   params.require(:creature).permit(:username, :creature)
  # end
end
