class SnippetsController < ApplicationController
  before_action :set_list, only: %i[ new show create edit create update destroy ]
  before_action :set_snippet, only: %i[ show edit update destroy ]

  # GET /snippets/:id 
  def show
 
  end

  # GET /snippets/new 
  def new
    @snippet = Snippet.new(list: @list)
  end

  # GET /snippets/:id/edit 
  def edit

  end

  # POST /snippets 
  def create   
    @snippet = @list.snippets.new(snippet_params)

    if @snippet.save
      @snippet.move_to_top # shift to 1st position.
      redirect_to board_list_path(@list.board_id, @list), notice: 'Snippet was successfully created.'
    else
      flash[:failmsg] = "Snippet fields cannot be empty."
      redirect_to new_list_snippet_path(@list.id)
    end
  end

  # PATCH/PUT /snippets/:id
  def update
    if @snippet.update(snippet_params)
      @snippet.move_to_top # shift to 1st position.
      redirect_to list_snippet_path(@snippet.list_id, @snippet.id), notice: 'Snippet was successfully updated.'
    else
      flash[:failmsg] = "Snippet fields cannot be empty."
      redirect_to edit_list_snippet_path(@list, @snippet.id)
    end
  end

  # DELETE /snippets/:id
  def destroy
    list_id = @snippet.list_id
    @snippet.destroy    

    redirect_to list_path(list_id), notice: "Snippet was successfully destroyed."    
  end

  private
    # Callbacks:
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    def set_list
      @list = List.find_by(id: params[:list_id])
    end  

    # Defined trusted params:
    def snippet_params
      params.require(:snippet).permit(:title, :description, :code_block, :pinned, :position)

    end
end
