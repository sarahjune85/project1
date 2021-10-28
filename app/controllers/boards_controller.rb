class BoardsController < ApplicationController
  before_action :check_for_login
  before_action :set_board, only: %i[show edit update destroy]

  # GET /boards/:id
  def show
    @list = List.find_by(params[:list_id]) 
    @user = @board.user    
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/:id/edit
  def edit
    @boards = @current_user.boards.order(position: :asc)
  end

  # POST /boards
  def create
    newboard = Board.new board_params
    @current_user.boards << newboard
    @current_user.boards.last.move_to_top

    if newboard.save
      redirect_to dashboard_path, notice: "#{newboard.name} board was successfully created."
    else
      redirect_to dashboard_path, notice: "Board fields cannot be empty."
    end    
  end

  # PATCH/PUT /boards/:id
  def update
    @boards = @current_user.boards.order(position: :asc)
   
    if @board.update(board_params)
      redirect_to dashboard_path, notice: "#{@board.name} board was successfully updated." 
    else
      flash[:failmsg] = "Board fields cannot be empty."
      redirect_to edit_board_path(@board)
    end    
  end

  # DELETE /boards/:id
  def destroy
    name = @board.name
    @board.destroy
    
    redirect_to dashboard_path, notice: "#{name} board was successfully destroyed."    
  end

  private
    # Callbacks:
    def set_user
      @user = User.find_by :email => session[:user_id]
    end

    def set_board
      @board = Board.find(params[:id])
    end

    # Defined trusted params:
    def board_params
      params.require(:board).permit(:name, :image, :description, :user_id, :position)
    end
end
