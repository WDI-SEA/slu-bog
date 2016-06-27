class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def main
  end

  def all
    @creatures = Creature.includes(:tags)
    render :json => @creatures, :include => :tags
  end
  
  def show
    @creature = Creature.find_by_id params[:id]
    render :json => @creature
  end

  def create
    @creature = Creature.create creature_params
    render :json => { }
    # update_tags(creature)
  end

  private
  def creature_params
    params.require(:creature).permit(:name, :description)
  end


end
