class ListsController < ApplicationController  # 
  before_action :set_board, only: %i[new edit create update destroy]
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists - boards/:id/
  def index
    @lists = List.order(position: :asc)
    @boards = Board.all
  end

  # GET /boards/:board_id/lists/:id
  def show
    @board = Board.find_by (params[:list_id])
  end

  # GET /boards/:board_id/lists/new
  def new
    @list = @board.lists.new
  end

  # GET /boards/:board_id/lists/:id/edit
  def edit

  end

  # POST /boards/:board_id/lists
  def create
    @list = @board.lists.new(list_params)   

    if @list.save
      @list.move_to_top # shift to 1st position.
      redirect_to board_path(@board.id), notice: "#{@list.name} list was successfully created."
    else
      flash[:failmsg] = "List fields cannot be empty."
      redirect_to new_board_list_path(@board.id)
    end
  end

  # PATCH/PUT /boards/:board_id/lists/:id
  def update
      if @list.update(list_params)
        @list.move_to_top # shift to 1st position.
        redirect_to board_path(@board.id), notice: "#{@list.name} list was successfully updated."
      else
        flash[:failmsg] = "List fields cannot be empty."
        redirect_to edit_board_list_path(@board.id, @list.id)
      end
  end

  # DELETE /boards/:board_id/lists/:id
  def destroy
    name = @list.name
    @list.destroy    

    redirect_to board_path(@board.id), notice: "'#{name}' list was successfully destroyed."    
  end

  private
    # Callbacks:
    def set_list
      @list = List.find(params[:id])
    end

    def set_board 
      @board = Board.find (params[:board_id])
    end

    # Defined trusted params:
    def list_params
      params.require(:list).permit(:name, :description, :position, :board_id)
    end
end
