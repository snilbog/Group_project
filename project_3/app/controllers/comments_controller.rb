class CommentsController < ApplicationController

	before_action :is_authenticated?

  def show
  end

  def new
  	@comments = Comment.new

  end

  def create
  	# @content = params[:content]
  	# render text: @content
  	Comment.create comment_params
  	redirect_to favorites_path
  end

  def edit
  end

  def destroy
    result = Comment.destroy params[:id]
    respond_to do |format|
      format.html {redirect_to :comments}
      format.json {render json: result}
    end
  end

  private
  def comment_params
  	params.require(:comments).permit(:user_id, :drink_id, :content)
  end
end