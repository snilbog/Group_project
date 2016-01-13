class HomeController < ApplicationController

	before_action :is_authenticated?
	#Don't have to be logged in to view drinks
	# skip_before_action :is_authenticated?, only: [:index]

  def index
  end
end
