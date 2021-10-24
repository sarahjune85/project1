class SnippetsController < ApplicationController
  before_action :set_snippet, only: %i[ show edit update destroy ]

  # GET /snippets 
  # needs to dive into list THROUGH user owned boards?!?
  # currently displaying EVERY list.
  def index
    @list = List.find_by(id: params[:list_id])
    @snippets = Snippet.order(position: :asc)
  end

  # GET /snippets/1
  def show
    @list = List.find_by(id: params[:list_id])
    @snippets = Snippet.order(position: :asc)
  end

  # GET /snippets/new
  def new
    @list = List.find_by(id: params[:list_id])
    @snippet = Snippet.new(list: @list)
  end

  # GET /snippets/1/edit
  def edit
  end

  # POST /snippets 
  def create # totally BROKEN!!!!!!!
    
    newsnippet = Snippet.new(snippet_params)
    puts newsnippet.inspect
    # @list = List.find_by(id: params[:list_id]) #somehow get this in there?
    # @list << newsnippet

    respond_to do |format|
      if newsnippet.save
        format.html { redirect_to board_path(@list.board_id), notice: 'Snippet was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippets/1 
  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to @snippet, notice: 'Snippet was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  def destroy
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to snippets_url, notice: "Snippet was successfully destroyed." }
    end
  end

  # def move # shoot for the moon?
  #   @snippet = Snippet.find(params[:snippet_id])
  #   to_list = params[:to_list_id]
  #   @snippet.list_id = to_list
  #   @snippet.position = params[:position]
  #   @snippet.save

  #   # broadcast_lists_update
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def snippet_params
      params.require(:snippet).permit(:title, :description, :code_block, :pinned, :position, :list_id)
    end
end
