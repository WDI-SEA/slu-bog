class MainController < ApplicationController
  def index
  	@taco = "Hello instance taco!"
  	@array = [1,2,3]
  end
end
