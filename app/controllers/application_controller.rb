# toggle these lines to use ::Base instead of ::API to enable templates and other things
# class ApplicationController < ActionController::Base
class ApplicationController < ActionController::API

	require 'json_web_token'

	# run this on all controller actions
	before_action :authenticate_request

	# Validates the token and user and sets the @current_user scope
	def authenticate_request

		# if there's an auth header set
		if auth_header = request.headers['Authorization']
			# remove 'Bearer ' from the string
			token = auth_header.split(' ').last
			# decode it
			begin
				jwt_payload = JsonWebToken.decode(token)
			rescue JWT::ExpiredSignature
				jwt_payload = false
			end

			# if the payload is valid
			if jwt_payload && JsonWebToken.valid_payload(jwt_payload[0])
				# set the user
				@current_user = User.find_by(id: jwt_payload[0]['user_id'])
			else
				# invalid payload
				# render json: {success: false, message: 'invalid payload'}, status: :bad_request and return
				
				# ALT option, will create anon user and return that JWT token
				redirect_to users_anon_path and return
			end
		else
			# no header set
			render json: {success: false, message: 'no auth header set'}, status: :bad_request and return
				
			# ALT option, will create anon user and return that JWT token
			# redirect_to users_anon_path and return
		end
	end

end
