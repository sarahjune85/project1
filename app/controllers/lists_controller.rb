class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]
  before_action :set_board, only: %i[new create]

  # GET /lists - boards/:id/
  def index
    @lists = List.order(position: :asc)
    @boards = Board.all
  end

  # GET /lists/1 
  def show
    set_board
    set_list # using private callbacks below
  end

  # GET /lists/new
  def new
    set_board # this needs to grab id from board
    @list = @board.lists.new
  end

  # GET /lists/1/edit - WORKING!!!!!!!!!!!
  def edit
    set_list
  end

  # POST /lists 
  def create
    @list = @board.lists.new(list_params)
    set_board
    respond_to do |format|
      if @list.save
        format.html { redirect_to board_lists_path, notice: "List was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1  - WORKING!!!!!!!!!!!
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: "List was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1  - WORKING!!!!!!!!!!!
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "List was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end


    ####### HALP ############
    def set_board
      @board = Board.find (params[:board_id])
    end
    ###### HALP #############


    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :description, :position, :board_id)
    end
end
