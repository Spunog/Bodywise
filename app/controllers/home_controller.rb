class HomeController < ApplicationController
	before_action :get_user, only: [:index]

	def index
		@goal_weight = @user.goals.first.weight_lbs
	end

	private

	def get_user
		@user = current_user
	end

end
