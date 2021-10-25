class ListsController < ApplicationController
  # before_action :set_list, only: %i[ show edit update destroy ]
  before_action :set_board, only: %i[new create]

  # GET /lists - boards/:id/
  def index
    @lists = List.order(position: :asc)
    @boards = Board.all
  end

  # GET /boards/:board_id/lists/:id
  def show
    set_board
    set_list # using private callbacks below
  end

  # GET /boards/:board_id/lists/new
  def new
    set_board # this needs to grab id from board
    @list = @board.lists.new
  end

  # GET /boards/:board_id/lists/:id/edit
  def edit
    set_list
    set_board
  end

  # POST /boards/:board_id/lists
  def create
    @list = @board.lists.new(list_params)
    set_board
    respond_to do |format|
      if @list.save
        format.html { redirect_to board_path(@board.id), notice: "#{@list.name} list was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/:board_id/lists/:id
  def update
    set_board
    @list = List.find(params[:id])
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to board_path(@board.id), notice: "'#{@list.name}' list was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/:board_id/lists/:id
  def destroy
    set_board
    list = List.find(params[:id])
    name = list.name
    list.destroy

    respond_to do |format|
      format.html { redirect_to board_path(@board.id), notice: "'#{name}' list was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def set_board
      @board = Board.find (params[:board_id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :description, :position, :board_id)
    end
end
