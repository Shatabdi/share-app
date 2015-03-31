class GroupsController < ApplicationController

	def new
		@group = Group.new
	end

	def create
		@emails = params[:email].split(",").map(&:strip)
		@group = Group.new(group_params)
		unless valid_email?(params[:emails])
			render new
			flash[:error] = "Your email format is not correct. Please check the format and enter again."
  end



	def group_params
		params.require(:group).permit(:name)
	end

	private
  def valid_email?(emails)
  	flag = true
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	emails.each do |email|
    	unless email =~ VALID_EMAIL_REGEX
    		flag = false
    		break
    	end
    end
    return flag
  end

end
