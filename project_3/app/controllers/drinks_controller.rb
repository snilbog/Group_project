class DrinksController < ApplicationController
	before_action :is_authenticated?

  def index
  	

  end

  def adv_search
  	base_url = 'http://addb.absolutdrinks.com/ingredients/'
  	response = RestClient.get base_url, {
  		:params => {
  			:apiKey => ENV['ABSOLUT_KEY'],
  			:start => '0',
  			:pageSize => '500'
  		}
  	}

  	##############
  	# Get all types:
  	@type = []

  	# Loop through all ingredients and just get UNIQUE type
  	@ingredients = JSON.parse(response)['result'].each do |ingredient|
  		@type.push(ingredient['type']) unless @type.include?(ingredient['type'])
  	end

  	# Get all ingredients and put into appropriate type to display them ass checkboxes
	@spirits = []
	@mixers = []
	@others = []
	@fruits = []
	@vodka = []
	@spices_herbs = []
	@rum = []
	@brandy = []
	@berries = []
	@whisky = []
	@gin = []
	@ice = []
	@tequila = []
	@decoration = []
	
  	@ingredients = JSON.parse(response)['result'].each do |ingredient|
  		case ingredient['type']
	  		when "spirits-other"
	  			@spirits.push(ingredient['id']) unless @spirits.include?(ingredient['id'])
	  		when "mixers"
	  			@mixers.push(ingredient['id']) unless @mixers.include?(ingredient['id'])
	  		when "others"
	  			@others.push(ingredient['id']) unless @others.include?(ingredient['id'])
	  		when "fruits"
	  			@fruits.push(ingredient['id']) unless @fruits.include?(ingredient['id'])
	  		when "vodka"
	  			@vodka.push(ingredient['id']) unless @vodka.include?(ingredient['id'])
	  		when "spices-herbs"
	  			@spices_herbs.push(ingredient['id']) unless @spices_herbs.include?(ingredient['id'])
	  		when "rum"
	  			@rum.push(ingredient['id']) unless @rum.include?(ingredient['id'])
	  		when "brandy"
	  			@brandy.push(ingredient['id']) unless @brandy.include?(ingredient['id'])
	  		when "berries"
	  			@berries.push(ingredient['id']) unless @berries.include?(ingredient['id'])
	  		when "whisky"
	  			@whisky.push(ingredient['id']) unless @whisky.include?(ingredient['id'])
	  		when "gin"
	  			@gin.push(ingredient['id']) unless @gin.include?(ingredient['id'])
	  		when "ice"
	  			@ice.push(ingredient['id']) unless @ice.include?(ingredient['id'])
	  		when "tequila"
	  			@tequila.push(ingredient['id']) unless @tequila.include?(ingredient['id'])
	  		when "decoration"
	  			@decoration.push(ingredient['id']) unless @decoration.include?(ingredient['id'])
  		end
  	end
  end

  def show
  end

  def result
  end

  def adv_result

  	# checked checkboxes (with same name) are passed automatically as an array 
  	# concat the array with join to match the api search url
  	search_term = params[:s].join("/and/")
  	base_url = 'http://addb.absolutdrinks.com/drinks/with/' + search_term
  	response = RestClient.get base_url, {
  		:params => {
  			:apiKey => ENV['ABSOLUT_KEY'],
  			:start => '0',
  			:pageSize => '500'
  		}
  	}
  	@drinks = JSON.parse(response)
  	# render json: @drinks
  end
end
