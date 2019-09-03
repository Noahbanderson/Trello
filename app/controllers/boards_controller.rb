class BoardsController < ApplicationController
  before_action :set_board, only: [:edit, :update, :destroy]

  def index
    @boards = Board.all_boards(current_user.id)
  end

  def new
    @board = current_user.boards.new
    render :template => "boards/_form"
  end

  def create
      #create an if statement to allow error messages
    if Board.create_board(current_user.id, board_params)
      redirect_to boards_path
    else
      render :template => "boards/_form"
    end
  end

  def edit
    render :template => "boards/_form"
  end

  def update
    if Board.update_board(@board.id, board_params)
      redirect_to board_lists_path(@board)
    else
      render :template => "boards/_form"
    end
  end

  def destroy
    Board.destroy(@board.id)
    #Board.destroy_board(@board.id, current_user.id)
    redirect_to boards_path
  end

  private

  def set_board
    @board = Board.single_board_user(current_user.id, params[:id])
  end

  def board_params
    params.require(:board).permit(:board_title, :b_o_number)
  end

end
