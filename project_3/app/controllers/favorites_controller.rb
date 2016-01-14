class FavoritesController < ApplicationController

	before_action :is_authenticated?

  def index
  	@favorites = Favorite.where("user_id" => @current_user.id)
    @comments = Comment.where("user_id" => @current_user.id)
  end

 def show
    @favorite = Favorite.find params[:id]
    @comments = Comment.where("drink_id" => params[:id]).where("user_id" => @current_user.id)
  end

  def create
  	Favorite.create post_params
    redirect_to favorites_path
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
    params.require(:favorites).permit(:drink_id, :description, :img, :user_id)
  end

end
