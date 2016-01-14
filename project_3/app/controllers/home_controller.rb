class HomeController < ApplicationController

	before_action :is_authenticated?
	#Don't have to be logged in to view drinks
	# skip_before_action :is_authenticated?, only: [:index]

  def index
  end

  def tools
  	base_url = 'http://addb.absolutdrinks.com/tools/'
  	response = RestClient.get base_url, {
  		:params => {
  			:apiKey => ENV['ABSOLUT_KEY']
  		}
  	}
  	@tools = JSON.parse(response)['result']
  	@video_link = nil
      
  end
end
