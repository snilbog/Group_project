class DrinksController < ApplicationController
  def index
  	base_url = 'http://addb.absolutdrinks.com/ingredients/'
  	# @searchTerm = params[:q]
  	# response = RestClient.get base_url, {:params => {:term => params[:q]}}
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


	@spirits = []
	@mixers = []
	@others = []
	@fruits = []
	@vodka = []
	@spices_herbs = []
	@rum = []
	@base_spirits = []
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
	  			@spirits.push(ingredient['name']) unless @spirits.include?(ingredient['name'])
	  		when "mixers"
	  			@mixers.push(ingredient['name']) unless @mixers.include?(ingredient['name'])
	  		when "others"
	  			@others.push(ingredient['name']) unless @others.include?(ingredient['name'])
	  		when "fruits"
	  			@fruits.push(ingredient['name']) unless @fruits.include?(ingredient['name'])
	  		when "vodka"
	  			@vodka.push(ingredient['name']) unless @vodka.include?(ingredient['name'])
	  		when "spices-herbs"
	  			@spices_herbs.push(ingredient['name']) unless @spices_herbs.include?(ingredient['name'])
	  		when "rum"
	  			@rum.push(ingredient['name']) unless @rum.include?(ingredient['name'])
	  		when "base spirits"
	  			@base_spirits.push(ingredient['name']) unless @base_spirits.include?(ingredient['name'])
	  		when "brandy"
	  			@brandy.push(ingredient['name']) unless @brandy.include?(ingredient['name'])
	  		when "berries"
	  			@berries.push(ingredient['name']) unless @berries.include?(ingredient['name'])
	  		when "whisky"
	  			@whisky.push(ingredient['name']) unless @whisky.include?(ingredient['name'])
	  		when "gin"
	  			@gin.push(ingredient['name']) unless @gin.include?(ingredient['name'])
	  		when "ice"
	  			@ice.push(ingredient['name']) unless @ice.include?(ingredient['name'])
	  		when "tequila"
	  			@tequila.push(ingredient['name']) unless @tequila.include?(ingredient['name'])
	  		when "decoration"
	  			@decoration.push(ingredient['name']) unless @decoration.include?(ingredient['name'])
  		end

  	end
  end

  def show
  end

  def result
  end

  def adv_result
  end
end
