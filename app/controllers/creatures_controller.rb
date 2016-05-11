class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
    render :json => @creatures
  end

  def create
    creature = Creature.create creature_params
    update_tags(creature)
    redirect_to creatures_path
  end

  def new
    @creature = Creature.new
    @tag = Tag.all
  end

  def edit
    @creature = Creature.find params[:id]
    @tags = Tag.all
    render :json => @creature
  end

  def show
    @creature = Creature.find params[:id]
    render :json => @creature
  end

  def update
    c = Creature.find params[:id]
    c.update creature_params
    update_tags(creature)
    redirect_to creatures_path
  end

  def destroy
    Creature.find(params[:id]).delete
    redirect_to creatures_path
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :description)
  end

  def update_tags(creature)
    # get the list of all checkboxes from the form
    tags = params[:creature][:tag_ids]
    # reset all the tags the creature currently has
    creature.tags.clear
    # go through all the tags from the form
    tags.each do |id|
      # only re-add tags where checkboxes were checked
      if not id.blank?
      creature.tags << Tag.find(id)
      end
    end
  end
end
