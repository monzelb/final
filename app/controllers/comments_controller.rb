class CommentsController < ApplicationController


  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new

  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
 def create
    if !current_user
      redirect_to login_path
    end
    @request = Request.find(params[:request_id])
    @comment = Comment.new(comment_params)
    current_user.comments << @comment
    @request.comments << @comment
    if @comment.body.length < 1 
      flash[:Error] = "Comment length : 1-200 characters. Comment length: Cannot be empty."
      redirect_to new_comment_path(params[:request_id])
    else
      redirect_to request_path(@request)
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def request_params
    params.require(:request).permit(:title, :address, :latitude, :longitude, :body, :user_id)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :request_id)
    end
end
