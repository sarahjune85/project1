class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]
  before_action :check_for_login

  # GET /boards/:id - BoardsController#show
  def show
    set_board
    # @lists = List.find_by(params[:board_id]) 
    @list = List.find_by(params[:list_id]) 
    @user = @board.user
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/:id/edit
  def edit
    set_board
  end

  # POST /boards
  def create
    newboard = Board.new board_params
    @current_user.boards << newboard

    respond_to do |format|
      if newboard.save
        format.html { redirect_to root_path, notice: "#{newboard.name} board was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/:id
  def update
    @board = Board.find(params[:id])
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to root_path, notice: "#{@board.name} board was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/:id
  def destroy
    board = Board.find(params[:id])
    name = board.name
    board.destroy
    
    redirect_to root_path, notice: "#{name} board was successfully destroyed."
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by :email => session[:user_id]
    end

    def set_board
      @board = Board.find(params[:id])
    end

    def set_lists
      @lists = List.find_by(params[:board_id]) 
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:name, :image, :description, :user_id)
    end
end
