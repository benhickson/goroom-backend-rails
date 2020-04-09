# enable Base instead of API to enable templates and other things
# class ApplicationController < ActionController::Base
class ApplicationController < ActionController::API

	# make methods here available to other controllers:
	# helper_method :logged_in?, :current_user

	# run these methods before any controller action
	# before_action :redirect_if_not_authorized
	# before_action :set_current_user

	private

	def set_current_user
		if session[:user_id]
			@user = User.find(session[:user_id])
		end
	end

	def redirect_if_not_authorized
		redirect_to login_path unless logged_in?
	end

	# helper method for #redirect_if_not_authorized
	def logged_in?
		!!current_user
	end

end
