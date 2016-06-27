class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def create
    creature = Creature.create creature_params
    update_tags(creature)
    
    redirect_to creatures_path


  end

  def new
    @creature = Creature.new
  end

  def edit
    @creature = Creature.find params[:id]
    @tags = Tag.all
  end

  def show
    @creature = Creature.find params[:id]
  end

  def update
    c = Creature.find params[:id]
    c.update creature_params
    redirect_to creatures_path
    update_tags(creature)
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
    #get list of all checkbozes from form
    tags = params[:create][:tag_ids]
    #reset creatures current tags
    puts tags

    creature.tags.clear
    # go thru all tags from form
    tags.each do |id|
      # re add the tags where checkboxes were checked
      if not id.blank?
              creature.tags << Tag.find(id)
      end
    end
  end
end
