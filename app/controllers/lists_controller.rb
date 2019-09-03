class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [ :edit, :update, :destroy]
  
  def index
    @lists = List.all_lists(@board)
  end

  def new
    @list = @board.lists.new
    render :template => "lists/_form"
  end

  def create
    List.create_list(@board, list_params) 
    redirect_to board_lists_path(@board)
  end

  def edit
    render :template => "lists/_form"
  end

  def update
    if List.update_list(@list.id, list_params)
      redirect_to board_lists_path(@list.board_id)
    else
      render :template => "lists/_form"
    end
  end

  def destroy
    List.destroy(@list.id)
    #List.destroy_list(@list)
    redirect_to board_lists_path(@list.board_id)
  end

  private

    def set_board
      @board = Board.single_board_id(params[:board_id])    
    end

    def set_list
      @list = List.single_list(params[:id])
    end

    def list_params
      params.require(:list).permit(:list_title, :l_o_number)
    end

end
