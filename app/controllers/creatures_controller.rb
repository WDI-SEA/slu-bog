class CreaturesController < ApplicationController

	def index
		@creatures = Creature.all
	end 

	def new
		@creatures = Creature.new
	end

	def create
		Creature.create creature_params
		redirect_to creatures_path
	end

	def show
		@creatures = Creature.find params[:id]
	end
 	
	def edit
		@creatures = Creature.find params[:id]
	end

	def update
		c = Creature.find params[:id]
		c.update creature_params
		redirect_to creature_path
	end

	def destroy
		Creature.find(params[:id]).delete
		redirect_to creatures_path
	end

	private
		def creature_params
		  		params.require(:creature).permit(:name, :description)
		end


end
