class LoginController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def logout
		reset_session
		redirect_to :root and return
	end
end
