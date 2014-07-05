class MemberController < ApplicationController
	before_action :get_member, only: [:profile,:graph]

	def index
		@users = User.all
	end

	def profile
		@graphURL = member_graph_path(params.merge(:username => @user.username))
	end

	def graph
		limit = (params.has_key?(:limit) && params[:limit].to_i != 0) ? params[:limit].to_i : 7
		@weights = @user.weights.where(share_category_id: get_public_categories).order('date_weighted DESC').limit(limit).reverse
		@graphURL = member_index_path(params.merge(:username => @user.username)) + '&limit=31' #default limit, will call this controller for json again, kinda weird, but think its ok?
	end

	private

    def get_member
      @user = User.where("lower(username) = ?", params[:username].downcase).first

      if !@user
	      flash.now[:notice] = 'Record not found'
	      render :template => "member/index"
      end

    end

    def get_public_categories
    	return 3 #1=private, 2=friends, 3=public
    end

end