class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
    @tags = Tag.all
  end

  def new
    @creature = Creature.new
    @tags = Tag.all

  end

  def create
    creature = Creature.create creature_params
    update_tags(creature)

    redirect_to creatures_path creature
  end

  def show
    @creature = Creature.find params[:id]
    @tags = Tag.all
    render :json => @creature 
  end

  def edit
    @creature = Creature.find params[:id]
    @tags = Tag.all
  end

  def update
    creature = Creature.find params[:id]
    creature.update creature_params
    update_tags(creature)

    redirect_to creatures_path
  end

  def destroy
    creature = Creature.find(params[:id])

    for tag in creature.tags
      tag.creatures.delete(creature)
    end

    creature.delete

    redirect_to creatures_path
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :description)
  end

  def update_tags(creature)
    tags = params[:creature][:tag_ids]
    puts tags

    creature.tags.clear

    tags.each do |id|    
      if not id.blank?
        creature.tags << Tag.find(id)
      end
    end
  end
end
