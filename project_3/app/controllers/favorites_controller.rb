class FavoritesController < ApplicationController

	before_action :is_authenticated?

  def index
  	@favorites = Favorite.where("user_id" => @current_user.id)
    @comments = Comment.where("user_id" => @current_user.id)
  end

 def show
    @favorite = Favorite.find params[:id]
    @comments = Comment.where("drink_id" => params[:id]).where("user_id" => @current_user.id)

    base_url = 'http://addb.absolutdrinks.com/drinks/' + @favorite['drink_id']
    response = RestClient.get base_url, {
      :params => {
        :apiKey => ENV['ABSOLUT_KEY'],
        :start => '0',
        :pageSize => '500'
      }
    }
    @drink = JSON.parse(response.body).first[1]
    # render json: @drink
  end

  def create
    posted = Favorite.find_or_create_by(drink_id: post_params[:drink_id], user_id: post_params[:user_id])
    if posted.save
      posted.img = post_params[:img]
    	posted.description = post_params[:description]
    end
    
    # Favorite.create post_params
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
