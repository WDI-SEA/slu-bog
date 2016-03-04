class HomesController < ApplicationController
  def index
    @creatures = Creature.all
  end
end
