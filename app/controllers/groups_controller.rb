class GroupsController < ApplicationController

	def new
		@group = Group.new
	end

	def create
		@emails = params[:email].split(",").map(&:strip)
		@group = Group.new(group_params)
  end



	def group_params
		params.require(:group).permit(:name)
	end

end
