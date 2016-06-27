class CreaturesController < ApplicationController
  def index # /creatures
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
    @tags = Tag.all
  end

  def create
    creature = Creature.create creature_params
    redirect_to(creature_path(creature))
    update_tags(creature)
  end

  def show
    @creature = Creature.find params[:id]
  end

  def edit
    @creature = Creature.find params[:id]
    @tags = Tag.all
  end

  def update
    c = Creature.find params[:id]
    c.update creature_params
    update_tags(c)
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
    puts tags
    # reset all the tags the creature currently has
    creature.tags.clear
    # go thru all the tags from the form
    tags.each do |id|
      # only re-add the tags where checkboxes were checked
    creature.tags << Tag.find(id) unless id.blank?
    end
  end

end
