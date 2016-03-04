class DragQueensController < ApplicationController
  def index
    @dragqueen = DragQueen.all
  end

  def create
    DragQueen.create drag_queen_params
    redirect_to drag_queens_path
  end

  def new
    @dragqueen = DragQueen.new
  end

  def edit
    @dragqueen = DragQueen.find(params[:id])
  end

  def show
    @dragqueen = DragQueen.find(params[:id])
  end

  def update
    DragQueen.find(params[:id]).update drag_queen_params
    redirect_to drag_queens_path
  end

  def destroy
    DragQueen.find(params[:id]).destroy
    redirect_to drag_queens_path
  end

  private

  def drag_queen_params
    params.require(:drag_queen).permit(:name, :description)
  end
end
