class HomeController < ApplicationController
	before_filter :authenticate_user!, :except => [:index]

	def index
		if current_user.nil?
			@goal_weight = 0
			@signed_in = false
		else
			@signed_in = true
			@user = current_user
			@goal_weight = @user.goals.first.weight_lbs
		end
		
	end

end
