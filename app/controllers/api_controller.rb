
class ApiController < ApplicationController

  def all
    @creatures = Creature.all
    render :json => @creatures
  end

  def show
    @creatures = Creature.find_by_id params[:id]
    render :json => @creatures
  end

  def create
    @creatures = Creature.create creature_params
  end

  private
  def creature_params
    params.require(:creature).permit(:username, :creature)
  end

end
