class FavoritesController < ApplicationController

	before_action :is_authenticated?

  def index
  	@favorites = Favorite.where("user_id" => @current_user.id)
  end

 def show
    @favorite = Favorite.find params[:id]
    @comments = Comment.where("drink_id" => params[:id]).where("user_id" => @current_user.id)
  end

  def create
  	
  end

  def destroy
  	result = Favorite.destroy params[:id]
    respond_to do |format|
    format.html {redirect_to :favorites}
    format.json {render json: result}
	end
  end

  private

  def post_params
    params.require(:favorite).permit(:drink_id, :description, :user_id)
  end

end
