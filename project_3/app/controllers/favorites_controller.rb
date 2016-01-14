class FavoritesController < ApplicationController

	before_action :is_authenticated?

  def index
  	@favorites = Favorite.where("user_id" => @current_user.id)
    @comments = Comment.where("user_id" => @current_user.id)
    # render json: @comments
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
    @drink = JSON.parse(response)['result']
    @video_link = nil
      if @drink.first['videos'].first['video']
        @video_id = @drink.first['videos'].first['video']
        @video_link = "http://www.youtube.com/embed/" + @video_id
        # render text: @video_link
      else 
      end

    @image_link = "http://assets.absolutdrinks.com/drinks/transparent-background-white/soft-shadow/300x400/" + @drink.first['id'] + ".png"
    # render text: @image_link
  end

  def create

    # to avoid adding the same drink more than once
    # posted = Favorite.find_or_create_by(drink_id: post_params[:drink_id], user_id: post_params[:user_id])
    # if posted.save
    # 	posted.description = "hello"
    #   posted.img = post_params[:img]
    # end

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
    if @current_user
      render text: "hello"
      # params.require(:favorites).permit(:drink_id, :description, :img)
    else
      redirect_to '/login'
    end
  end

end
