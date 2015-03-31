class Group < ActiveRecord::Base

	has_and_belongs_to_many :groups

	def email_info(emails)
		
	end

end
