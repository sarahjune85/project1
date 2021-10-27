class SnippetsController < ApplicationController
  before_action :set_list, only: %i[ new create edit create update destroy ]
  before_action :set_snippet, only: %i[ show edit update destroy ]

  # GET /snippets - unused route.
  # needs to dive into list THROUGH user owned boards?!?
  # currently displaying EVERY list.
  # def index
  #   @list = List.find_by(id: params[:list_id])
  #   @snippets = Snippet.order(position: :asc)
  # end

  # GET /snippets/:id - list_snippet_path
  def show
    set_snippet
    set_list
  end

  # GET /snippets/new - new_list_snippet_path
  def new
    set_list
    @snippet = Snippet.new(list: @list)
  end

  # GET /snippets/:id/edit - edit_list_snippet_path
  def edit
    set_snippet
    set_list
  end

  # POST /snippets 
  def create #     
    @snippet = @list.snippets.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to board_list_path(@list.board_id, @list), notice: 'Snippet was successfully created.' }
      else
        render :new # show them the form again.
      end
    end
  end

  # PATCH/PUT /snippets/1 
  def update
    # set_list
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to list_snippet_path(@snippet.list_id, @snippet.id), notice: 'Snippet was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  def destroy
    list_id = @snippet.list_id
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to list_path(list_id), notice: "Snippet was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    def set_list
      @list = List.find_by(id: params[:list_id])
    end  

    # Only allow a list of trusted parameters through.
    def snippet_params
      params.require(:snippet).permit(:title, :description, :code_block, :pinned, :position)

    end
end
