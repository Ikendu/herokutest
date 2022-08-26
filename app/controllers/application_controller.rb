class ApplicationController < ActionController::Base
	before_action :set_current_user
	before_action :admin_only, {only: [:new]}

	def set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end

	def admin_only
		if @current_user == nil
			flash[:notice] = "Login as Admin to have access"
			redirect_to("/admin")
		end
	end
	
end
