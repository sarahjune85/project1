class ListsController < ApplicationController  # 
  before_action :set_board, only: %i[new edit create update destroy]

  # GET /lists - boards/:id/
  def index
    @lists = List.order(position: :asc)
    @boards = Board.all
  end

  # GET /boards/:board_id/lists/:id
  def show
    set_list
    @board = Board.find_by (params[:list_id])
  end

  # GET /boards/:board_id/lists/new
  def new
    @list = @board.lists.new
  end

  # GET /boards/:board_id/lists/:id/edit
  def edit
    set_list
  end

  # POST /boards/:board_id/lists
  def create
    @list = @board.lists.new(list_params)
    @board.lists.last.move_to_top
    respond_to do |format|
      if @list.save
        format.html { redirect_to board_path(@board.id), notice: "'#{@list.name}' list was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/:board_id/lists/:id
  def update
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
