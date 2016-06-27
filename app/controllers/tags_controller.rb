class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tags = Tag.find params[:id]
    @creatures = @tag.creatures
  end

end
