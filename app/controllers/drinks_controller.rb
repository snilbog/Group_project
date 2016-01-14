class DrinksController < ApplicationController
	before_action :is_authenticated?
	# skip_before_action :is_authenticated, only:[:adv_search]
	#Don't have to be logged in to view drinks --maybe
	# skip_before_action :is_authenticated?, only: [:index, :adv_search]

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
    @drinks = JSON.parse(response).first[1]
  end

  def result
    if params[:srch_term].blank?
      flash[:warning] = "Please enter a drink"
      redirect_to '/'
    else
  	base_url = 'http://addb.absolutdrinks.com/quickSearch/drinks/' + params[:srch_term]

	  	response = RestClient.get base_url, {
	  		:params => {
	  			:apiKey => ENV['ABSOLUT_KEY'],
	  			:start => '0',
	  			:pageSize => '500'
	  		}
	  	}
      if response
        @drinks = JSON.parse(response).first[1]
      # render json: @drinks
      else 
        flash[:warning] = "No result found."
        redirect_to '/'
      end
    end
  end

  def adv_result

  	# if no checkedboxes are checked, redirect to advance search page with flash message
    if params[:s] == nil
      search_term = nil

    # multiple checkboxes, join the array element ==> element1/and/element2/and/element3 to match the API call
    elsif params[:s].length > 1
      search_term = params[:s].join("/and/")

    # only one checked, don't join the array
    elsif params[:s].length == 1
      search_term = params[:s][0]
    end

    if search_term == nil
      flash[:danger] = "Please choose at least one ingredients"
      redirect_to "/drinks/adv"
    else
  	base_url = 'http://addb.absolutdrinks.com/drinks/with/' + search_term
  	response = RestClient.get base_url, {
  		:params => {
  			:apiKey => ENV['ABSOLUT_KEY'],
  			:start => '0',
  			:pageSize => '500'
  		}
  	}
  	@drinks = JSON.parse(response.body).first[1]
    end
  	# render json: @drinks
  end
end
