class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def create
    Creature.create creature_params
    redirect_to creatures_path
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
  end

  def destroy
  end

  private

  def creature_params
    params.require(:creature).permit(:content, :name)
  end
end
