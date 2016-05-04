class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def about
  end

  def create
    creature = Creature.create creature_params
    redirect_to creature_path creature
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy

  end

  private

  def creature_params
    params.require(:tweet).permit(:content, :username)
  end
end
